# Firestore Schema

This document describes the Firestore collections that the backend reads or writes.

## 1. Data Ownership Model

There are three kinds of collections in this backend:

- backend-owned workflow collections
  Examples: `consultations`, `training_applications`, `license_verifications`, `notifications`, `support_reports`, `admin_tasks`

- shared profile collections
  Examples: `users`, `lawyers`

- lookup/config collections
  Examples: `specializations`, `cities`, `areas`, `genders`, `work_destinations`

The backend depends on stable collection names and several stable field names. Mobile code and Firestore rules also depend on the same shape.

## 2. Collection Reference

### `users/{uid}`

Purpose:

- base user profile
- stores some device-token and account metadata

Fields commonly used by backend:

- `accountType`
- `isTrainee`
- `deviceFcmToken`
- `deviceFcmTokenUpdatedAt`
- `devicePlatform`
- `email`

Written by:

- `POST /devices/fcm_token`
- training application flow sets `isTrainee = true`
- admin creation script may create or patch user profile

Read by:

- role fallback in `resolve_user_role()`
- notification token resolution

Document id:

- Firebase Auth uid

### `lawyers/{uid}`

Purpose:

- lawyer profile and discoverability data

Fields commonly used by backend:

- `verified`
- `acceptsTrainees`
- `legalFieldIds`
- `legalFields`
- `city`
- `cityId`
- `areaId`
- `workplace`
- `workDestinationId`
- `name` or `fullName`
- `licenseNumber`
- `experienceYears` or `yearsOfExperience`
- `avatarUrl`
- `availability`
- `deviceFcmToken`

Written by:

- verification flow updates `verified`
- device token registration for lawyer accounts
- seed and migration scripts

Read by:

- role fallback in `resolve_user_role()`
- AI recommendation
- training application gating
- notification token resolution

Document id:

- Firebase Auth uid

### `specializations/{specializationId}`

Purpose:

- legal specialization lookup and AI routing source of truth

Fields:

- `nameAr`
- `nameEn`
- `active`
- `iconUrl`

Read by:

- AI classification and recommendation
- consultation specialization validation

Document id:

- seeded slug, for example `family-law`

### `consultations/{consultationId}`

Purpose:

- client-to-lawyer consultation request lifecycle

Fields created by backend:

- `clientUid`
- `lawyerUid`
- `caseText`
- `specializationId`
- `status`
- `createdAt`
- `updatedAt`

Document id:

- auto id

Status values currently used:

- `pending`
- `accepted`
- `rejected`
- `closed`

### `chats/{chatId}`

Purpose:

- chat shell created when a consultation is accepted

Fields created by backend:

- `participants`
- `consultationId`
- `lastMessage`
- `updatedAt`

Document id:

- auto id

Subcollection:

- `chats/{chatId}/messages/{messageId}`

Important note:

- the backend does not create messages
- Firestore rules govern message reads and writes directly

### `training_opportunities/{opportunityId}`

Purpose:

- training openings posted by lawyers

Fields currently assumed by backend:

- `lawyerUid`
- `isOpen` for indexed query support

Read by:

- training application creation flow

Written by backend:

- not by the current router set in this repo

### `training_applications/{applicationId}`

Purpose:

- trainee application to a lawyer or training opportunity

Fields created by backend:

- `opportunityId`
- `traineeUid`
- `lawyerUid`
- `fullName`
- `university`
- `faculty`
- `cityId`
- `city`
- `areaId`
- `area`
- `graduationYear`
- `cvUrl`
- `status`
- `submittedAt`
- `updatedAt`
- `dedupeKey`

Document id:

- deterministic: `{lawyerUid}_{traineeUid}`

Status values currently used:

- `pending`
- `accepted`
- `rejected`
- `cancelled`

### `license_verifications/{lawyerUid}`

Purpose:

- verification request and review record for a lawyer

Fields:

- `licenseNumber`
- `nationalId`
- `status`
- `reviewNotes`
- `requestedAt`
- `verifiedAt`

Document id:

- lawyer uid

Status values currently used:

- `verified`
- `needsReview`
- `rejected`

### `notifications/{userUid}/items/{notificationId}`

Purpose:

- per-user notification inbox

Fields:

- `type`
- `title`
- `message`
- `data`
- `isSeen`
- `timestamp`
- `seenAt`
- `updatedAt`

Document ids:

- root document id is the target user uid
- item document id is auto-generated

### `support_reports/{reportId}`

Purpose:

- user-submitted support or abuse report

Fields:

- `reporterUid`
- `role`
- `subject`
- `details`
- `status`
- `adminNotes`
- `createdAt`
- `updatedAt`

Document id:

- auto id

Status values currently used:

- `open`

### `admin_tasks/{taskId}`

Purpose:

- simple queue for admin follow-up work

Fields:

- `type`
- `targetId`
- `status`
- `notes`
- `createdAt`

Document id:

- auto id

Task types currently used:

- `license_review`
- `support_report`

### Lookup collections

Collections:

- `genders`
- `cities`
- `areas`
- `work_destinations`

Purpose:

- public lookup lists returned by `/lookups/*`

## 3. Document Id Strategy

Stable document ids are important in this backend.

Patterns:

- `users/{uid}` and `lawyers/{uid}` use Firebase uid
- `license_verifications/{lawyerUid}` uses lawyer uid
- `training_applications/{lawyerUid}_{traineeUid}` uses a dedupe id
- `notifications/{userUid}` uses target user uid
- most workflow records use Firestore auto ids

Why this matters:

- deterministic ids prevent duplicate training applications
- shared uid-based ids make lookup and claim sync simpler

## 4. Field Naming Realities

The backend already handles some mixed field naming because Firestore data is not fully normalized yet.

Examples:

- lawyer name may be in `name` or `fullName`
- experience may be in `experienceYears` or `yearsOfExperience`
- specialization matching may use `legalFieldIds` or `legalFields`
- city matching may use `cityId` or `city`
- device tokens may appear in current or legacy field names

When adding new code, avoid introducing another variant unless migration is planned.

## 5. Security Rules Highlights

Source:

- `backend/firebase/firestore.rules`

Important rules:

- `users`
  - read: owner, admin, or lawyer
  - write: owner or admin

- `lawyers`
  - read: public
  - write: owner or admin

- `consultations`
  - create: signed-in client matching `clientUid`
  - read: participants or admin
  - update: participants or admin

- `chats` and `messages`
  - participant-based access

- `training_opportunities`
  - read: any signed-in user
  - write: owning lawyer or admin

- `training_applications`
  - create: trainee
  - read: trainee, lawyer, or admin
  - update: lawyer or admin

- `notifications`
  - owner or admin only

- `support_reports`
  - create: any signed-in user
  - read/update: admin or original reporter

- `admin_tasks`
  - admin only

Important implication:

- the mobile app can access some collections directly through Firestore rules
- the backend is not the only enforcement layer

## 6. Indexes Required By Current Queries

Source:

- `backend/firebase/firestore.indexes.json`

Current composite indexes:

### `lawyers`

Used by AI recommendation queries.

Index combinations:

- `verified + city + availability + legalFieldIds array_contains`
- `verified + cityId + availability + legalFieldIds array_contains`

### `chats`

Used for participant chat list queries.

Index:

- `participants array_contains + updatedAt desc`

### `training_applications`

Used for lawyer-side application list queries.

Index:

- `lawyerUid + status + submittedAt desc`

### `training_opportunities`

Used for opportunity listing by lawyer/open state.

Index:

- `lawyerUid + isOpen`

## 7. Backend-Owned Side Effects

When debugging data, these are the main write side effects:

- verification request/review
  - writes `license_verifications`
  - updates `lawyers.verified`
  - may update Firebase custom claims
  - creates notifications
  - may create admin task

- consultation accepted
  - updates `consultations`
  - creates `chats`
  - creates notification

- training application
  - writes `training_applications`
  - creates notification
  - best-effort updates `users.isTrainee`

- support report
  - writes `support_reports`
  - creates admin task

- device token registration
  - updates `users` or `lawyers`
