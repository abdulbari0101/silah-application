# Code Architecture

This document explains how the backend is organized and how a request moves through the code.

## 1. High-Level Runtime Shape

The backend is a single FastAPI app with direct Firebase Admin access.

Main layers:

- `app/main.py`
  App creation, CORS, startup hooks, exception handlers, router registration.

- `app/config.py`
  Environment-backed settings loaded from `backend/env/.env`.

- `app/firebase.py`
  Firebase Admin initialization and cached clients for Firestore, Auth, Messaging, and Storage.

- `app/auth.py`
  Firebase ID token verification and role enforcement helpers.

- `app/schemas.py`
  Pydantic request and response models.

- `app/routers/`
  HTTP entrypoints. Validation happens here through Pydantic. Some workflow rules also live here.

- `app/services/`
  Shared business helpers:
  - `firestore_service.py` for common Firestore, claims, notification, and lookup logic
  - `openai_client.py` for AI classification
  - `verification.py` for mock lawyer verification

- `app/utils/`
  Response envelope helpers, UTC timestamp helper, and structured Firebase logging.

## 2. Request Lifecycle

Typical protected request flow:

1. FastAPI receives the request in `app/main.py`.
2. Router dependency `verify_id_token()` in `app/auth.py` reads `Authorization`.
3. Firebase Admin verifies the ID token.
4. The backend resolves the user's role:
   - first from token claims
   - then, if missing, by checking Firestore collections
5. Pydantic validates the payload using models from `app/schemas.py`.
6. The router executes workflow logic:
   - sometimes directly in the router
   - sometimes by calling helper functions in `app/services/`
7. Firestore is read or written.
8. Optional side effects run:
   - custom claim updates
   - admin task creation
   - notification persistence
   - FCM push send
9. Response data is wrapped by `success_response()` from `app/utils/responses.py`.

Error flow:

- `HTTPException` is converted into the standard `Result` error envelope.
- Any unexpected exception becomes HTTP 500 with `Internal server error`.

## 3. Router Inventory

| Router file | Prefix | Endpoints | Main responsibilities |
| --- | --- | --- | --- |
| `routers/ai.py` | `/ai` | `POST /classify`, `POST /recommend` | AI classification and lawyer recommendation |
| `routers/auth.py` | `/auth` | `POST /sync-role` | Sync resolved role into Firebase custom claims |
| `routers/consultations.py` | `/consultations` | `POST /`, `PATCH /{id}` | Create consultation request, update status, create chat on acceptance |
| `routers/devices.py` | `/devices` | `POST /fcm_token` | Save current device FCM token into Firestore |
| `routers/lookups.py` | `/lookups` | `GET /genders`, `/cities`, `/areas`, `/work-destinations` | Read lookup collections |
| `routers/notifications.py` | `/notifications` | `GET /`, `PATCH /seen` | Fetch user notifications and mark unseen items as seen |
| `routers/support.py` | `/support` | `POST /reports`, `GET /reports` | Create support reports and list them for admins |
| `routers/training.py` | `/training` | `POST /applications`, `PATCH /applications/{id}` | Create and review training applications |
| `routers/verification.py` | `/verification` | `POST /request`, `POST /review` | Verification request flow and admin review |

## 4. Cross-Cutting Patterns

### 4.1 Authentication and roles

`app/auth.py` is the gatekeeper for protected routes.

Important behavior:

- Bearer token is mandatory on protected endpoints.
- Role resolution is not claim-only.
- If the token has no role claim, the backend checks Firestore:
  - `lawyers/{uid}` means `lawyer`
  - `users/{uid}` means `user`
- Admin is only recognized from claims, not from Firestore profile data alone.

This means `POST /auth/sync-role` matters. It writes the resolved role back into Firebase custom claims so future requests do not depend on Firestore fallback.

### 4.2 Firestore client usage

`app/firebase.py` caches Firebase clients with `@lru_cache(maxsize=1)`.

Implications:

- the app reuses one Firestore client per process
- the app reuses one Messaging module handle per process
- settings changes after process start do not take effect until restart

### 4.3 Response format

All successful responses use:

```json
{
  "Result": { "ErrorNo": 1, "ErrorNa": "Operation successful" }
}
```

All handled errors use:

```json
{
  "Result": { "ErrorNo": 0, "ErrorNa": "..." }
}
```

Implementation detail:

- `success_response()` mutates the input dict by appending `Result`
- do not reuse the same dict object afterward if you need it unchanged

### 4.4 Logging

`app/utils/firebase_logger.py` logs structured JSON messages.

It masks likely sensitive fields by key name, including:

- token
- national id
- license
- email
- phone

It also truncates long strings over 1000 characters.

### 4.5 Where business logic really lives

The codebase is partly layered and partly pragmatic:

- reusable read/write helpers are in `services/firestore_service.py`
- OpenAI request logic is in `services/openai_client.py`
- verification decision logic is in `services/verification.py`
- workflow orchestration for consultations, training, support, and verification still lives mostly inside routers

When extending the backend, follow the existing pattern first. If a router starts holding repeated cross-feature logic, extract that logic into `services/`.

## 5. Important Implementation Details

### AI classifier object lifetime

`routers/ai.py` creates a module-level `_classifier = OpenAIClassifier()`.

Implication:

- OpenAI settings are captured when the module is imported
- changing `.env` values requires an app restart

### Role resolution behavior

`resolve_user_role()` currently returns only:

- `lawyer`
- `user`

It never returns `admin`. Admin must come from Firebase custom claims.

### Verification toggle setting

`SILAH_ALLOW_MOCK_NAJIZ` exists in `app/config.py`, but the current verification router always calls `mock_najiz_check()` directly.

Implication:

- verification is always mock-based today
- the setting is currently informational, not functional

### Shared Firestore helper coverage

`firestore_service.py` already centralizes:

- active specialization lookup
- lawyer search
- notification persistence and FCM send
- admin task creation
- role and verified custom claim updates
- device token persistence

It does not centralize:

- consultation workflow transitions
- training application transition rules
- support report CRUD flow

## 6. Endpoint Ownership Table

Use this when you need to find the code for a behavior quickly.

| Behavior | Main files |
| --- | --- |
| App startup and error handling | `app/main.py` |
| Token verification and admin guard | `app/auth.py` |
| Request/response schemas | `app/schemas.py` |
| AI request to OpenAI | `app/services/openai_client.py` |
| Mock verification decision | `app/services/verification.py` |
| Notifications, claims, shared Firestore helpers | `app/services/firestore_service.py` |
| Consultation business flow | `app/routers/consultations.py` |
| Training application business flow | `app/routers/training.py` |
| Support report business flow | `app/routers/support.py` |
| Notification fetch/mark-seen endpoints | `app/routers/notifications.py` |
| Public lookup endpoints | `app/routers/lookups.py` |
| Firestore access policy | `firebase/firestore.rules` |
| Firestore composite indexes | `firebase/firestore.indexes.json` |
