# Business Flows

This document explains the current feature logic as implemented in code today.

## 1. Auth And Role Sync

### Code path

- `app/auth.py`
- `app/routers/auth.py`
- `app/services/firestore_service.py`

### Logic

Protected endpoints use `verify_id_token()`:

1. Read `Authorization: Bearer <token>`.
2. Verify with Firebase Admin.
3. Try to read role from token claims.
4. If role is missing:
   - if `lawyers/{uid}` exists, resolve role as `lawyer`
   - else if `users/{uid}` exists, resolve role as `user`
   - else default to `user`

`POST /auth/sync-role` then persists that resolved role into Firebase custom claims.

### Why it exists

The mobile app may sign in before claims are present on the token. This endpoint lets the backend normalize identity state and avoid repeated Firestore role lookups on later requests.

### Current constraints

- Admin is claim-based only.
- Firestore profile data alone does not make a user admin.

## 2. AI Classification And Recommendation

### Code path

- `app/routers/ai.py`
- `app/services/openai_client.py`
- `app/services/firestore_service.py`

### `POST /ai/classify`

Logic:

1. Read active specializations from Firestore.
2. Build the list of allowed labels from `nameEn` and `nameAr`.
3. Send the case text and allowed labels to OpenAI.
4. Parse the JSON response.
5. Reject unknown labels by converting them to `specialization = "unknown"`.
6. Map the chosen label back to the specialization document payload.

### `POST /ai/recommend`

Logic:

1. Run the same classification flow.
2. Resolve the specialization document id.
3. If specialization resolution succeeds, query verified lawyers.
4. Optional filters:
   - `city`
   - `availability`
5. Return:
   - resolved specialization payload
   - specialization id
   - lawyer profile list

### Lawyer search behavior

`find_verified_lawyer_profiles()` searches lawyers like this:

1. Base filter: `verified == true`
2. Optional filter: `availability == <value>`
3. Optional city filter on either:
   - `cityId`
   - `city`
4. Specialization match first tries `legalFieldIds`
5. If empty, fallback tries specialization names in `legalFields`
6. Results are de-duplicated by document id and sorted by `fullName`, then id

### Fallback behavior

If OpenAI is unavailable, misconfigured, or returns invalid JSON:

- specialization becomes `unknown`
- confidence becomes `0.0`
- `/ai/recommend` returns no lawyers

### Important current notes

- The AI output must exactly match one of the allowed specialization labels before it reaches the router-level resolver.
- There is no server-side minimum confidence threshold yet.
- This flow is routing only. It does not generate legal advice.

## 3. Lawyer Verification

### Code path

- `app/routers/verification.py`
- `app/services/verification.py`
- `app/services/firestore_service.py`

### `POST /verification/request`

Authorization:

- caller must be the same `lawyerUid`
- admin may also call it

Logic:

1. Run `mock_najiz_check(licenseNumber, nationalId)`.
2. Write or merge `license_verifications/{lawyerUid}`.
3. Branch by result:
   - `verified`
   - `needsReview`
   - `rejected`

Mock decision rules:

- license ends with `0` -> `rejected`
- license ends with `9` -> `needsReview`
- any other ending -> `verified`

Side effects by result:

- `verified`
  - set `lawyers/{uid}.verified = true`
  - set Firebase custom claim `verified = true`
  - notify the lawyer

- `needsReview`
  - create `admin_tasks` item of type `license_review`
  - notify the lawyer

- `rejected`
  - set `lawyers/{uid}.verified = false`
  - set Firebase custom claim `verified = false`
  - notify the lawyer

### `POST /verification/review`

Authorization:

- admin only

Logic:

1. Merge review result into `license_verifications/{lawyerUid}`.
2. If status is `verified`, mark lawyer verified and set claim.
3. If status is `rejected`, clear lawyer verified flag and claim.
4. Notify the lawyer.

### Current implementation notes

- Verification is fully mock-based right now.
- `SILAH_ALLOW_MOCK_NAJIZ` is defined in settings but not used by router logic.
- Admin review writes `verifiedAt` even when the final status is `rejected`. That is the current code behavior.

## 4. Consultations And Chat Enablement

### Code path

- `app/routers/consultations.py`
- `app/services/firestore_service.py`

### `POST /consultations`

Authorization:

- caller must be `clientUid`
- admin may also create it

Validation:

- either `specializationId` or `specialization` must be provided
- the value must resolve to an active specialization

Logic:

1. Resolve specialization into a canonical specialization id.
2. Create a new `consultations` document with:
   - `clientUid`
   - `lawyerUid`
   - `caseText`
   - `specializationId`
   - `status = pending`
   - `createdAt`
3. Notify the lawyer about the new request.

### `PATCH /consultations/{consultationId}`

Allowed statuses:

- `accepted`
- `rejected`
- `closed`

Authorization:

- `accepted` or `rejected`: lawyer or admin
- `closed`: client, lawyer, or admin

Logic:

1. Load the consultation document.
2. Validate caller against requested status.
3. Merge new `status` and `updatedAt`.
4. If accepted:
   - create a `chats` document with both participants
   - notify the client
5. If rejected:
   - notify the client

### Chat policy

The backend creates only the chat shell document. Message writes are enforced by Firestore rules.

### Current implementation notes

- The router does not enforce a strict state machine. For example, it does not check whether a consultation was already accepted before accepting again.
- Every successful `accepted` update creates a new `chats` document. There is no dedupe check in the backend.
- The consultation stores only `specializationId`, not the specialization display name.

## 5. Training Applications

### Code path

- `app/routers/training.py`
- `app/services/firestore_service.py`

### `POST /training/applications`

Authorization:

- caller must be `traineeUid`
- admin may also create it

Target resolution:

1. The backend first tries `training_opportunities/{opportunityId}`.
2. If that document exists, it uses `lawyerUid` from the opportunity.
3. If it does not exist, the backend treats `opportunityId` itself as a lawyer uid.

Lawyer gating:

- `lawyers/{lawyerUid}` must exist
- `verified` must be truthy
- `acceptsTrainees` must be truthy

Duplicate protection:

1. Build deterministic application id:
   - `{lawyerUid}_{traineeUid}`
2. Check whether that exact document already exists.
3. Also scan legacy docs where:
   - `lawyerUid == <lawyerUid>`
   - and `traineeUid == <traineeUid>`
4. If either exists, return HTTP `409`

Write behavior:

- create or overwrite `training_applications/{lawyerUid}_{traineeUid}`
- set `status = pending`
- set `submittedAt`
- store a `dedupeKey`

Side effects:

- notify the lawyer
- best-effort merge `users/{traineeUid}.isTrainee = true`

### `PATCH /training/applications/{applicationId}`

Allowed statuses:

- `accepted`
- `rejected`
- `cancelled`

Authorization:

- lawyer or admin only

Logic:

1. Load the application document.
2. Ensure caller is the target lawyer or admin.
3. Merge new status and `updatedAt`.
4. Notify the trainee.

### Current implementation notes

- The schema allows `cancelled`, but the router currently does not allow the trainee to perform the cancellation. Only lawyer or admin can update status.
- `opportunityId` is overloaded: it can be a real opportunity id or a lawyer uid fallback.

## 6. Notifications And Device Tokens

### Code path

- `app/routers/devices.py`
- `app/routers/notifications.py`
- `app/services/firestore_service.py`

### Device token registration

Endpoint:

- `POST /devices/fcm_token`

Logic:

1. Get authenticated uid from token.
2. Save one canonical token field:
   - `deviceFcmToken`
   - `deviceFcmTokenUpdatedAt`
   - optional `devicePlatform`
3. Storage target depends on role:
   - `lawyer` -> `lawyers/{uid}`
   - `user` or `admin` -> `users/{uid}`
4. If role is missing, fallback chooses an existing profile collection if possible.

### Notification creation

`create_notification()` does two things:

1. Persist the notification under:
   - `notifications/{userUid}/items/{autoId}`
2. Optionally send push through Firebase Messaging

Push token resolution order:

1. explicit token args if provided
2. user document token fields
3. lawyer document token fields

Legacy token keys are still supported during reads.

### Notification fetch

Endpoint:

- `GET /notifications?limit=<n>`

Logic:

1. Read latest notifications ordered by `timestamp desc`
2. Build response items
3. Run a separate query for unseen count

### Mark seen

Endpoint:

- `PATCH /notifications/seen`

Logic:

1. Query unseen docs for the authenticated user
2. Batch-update each one with:
   - `isSeen = true`
   - `seenAt`
   - `updatedAt`

### Current implementation notes

- Push send failures do not fail the main business flow.
- The notification count query uses document streaming, not Firestore aggregate count.

## 7. Support Reports

### Code path

- `app/routers/support.py`
- `app/services/firestore_service.py`

### `POST /support/reports`

Authorization:

- caller must match `reporterUid`
- admin may not submit support reports

Logic:

1. Trim and validate `details`.
2. Create a `support_reports` document with:
   - `reporterUid`
   - caller role
   - optional trimmed subject
   - `status = open`
   - timestamps
3. Create an `admin_tasks` item of type `support_report`

### `GET /support/reports`

Authorization:

- admin only

Logic:

1. Query `support_reports`
2. Order by `createdAt desc`
3. Return normalized response items

### Current implementation notes

- The backend exposes create and list only.
- Firestore rules also allow the original reporter to update their support report directly, which is broader than the current HTTP API.

## 8. Public Lookup Endpoints

### Code path

- `app/routers/lookups.py`

Endpoints:

- `GET /lookups/genders`
- `GET /lookups/cities`
- `GET /lookups/areas`
- `GET /lookups/work-destinations`

Logic:

1. Read every document in the target collection.
2. If a document has no `id` field, inject the Firestore document id into the response.
3. Return items as-is under `items`.

These routes are intentionally public and do not require authentication.
