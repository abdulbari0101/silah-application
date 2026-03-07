# Development Guide

This document covers local setup, configuration, testing, scripts, and change workflow.

## 1. Local Setup

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Test command:

```bash
cd backend
pytest
```

## 2. Environment Variables

Settings are defined in `app/config.py` and loaded from `backend/env/.env`.

| Variable | Purpose | Notes |
| --- | --- | --- |
| `SILAH_APP_ENV` | environment label | default: `dev` |
| `SILAH_ALLOWED_ORIGINS` | comma-separated CORS allowlist | default: `*` |
| `SILAH_FIREBASE_CREDENTIALS` | path to Firebase Admin JSON | default: `env/firebase-service-account.json` |
| `SILAH_FIREBASE_PROJECT_ID` | optional project id override | currently defined in settings, not directly consumed elsewhere |
| `SILAH_FIREBASE_STORAGE_BUCKET` | default Firebase Storage bucket | used when Firebase app initializes |
| `SILAH_OPENAI_API_KEY` | OpenAI API key | if missing, AI routes fall back to `unknown` |
| `SILAH_OPENAI_MODEL` | model name | default: `gpt-4o-mini` |
| `SILAH_OPENAI_ENDPOINT` | chat completions endpoint | default: OpenAI `/v1/chat/completions` |
| `SILAH_OPENAI_TIMEOUT_SECONDS` | HTTP timeout | default: `20` |
| `SILAH_OPENAI_MAX_TOKENS` | max output tokens | default: `200` |
| `SILAH_OPENAI_TEMPERATURE` | sampling temperature | default: `0.0` |
| `SILAH_ALLOW_MOCK_NAJIZ` | intended mock toggle | currently not used by the router logic |

## 3. Dependency Stack

From `requirements.txt`:

- `fastapi[standard]`
- `uvicorn[standard]`
- `pydantic-settings`
- `firebase-admin`
- `requests`
- `python-dotenv`
- `pytest`
- `pytest-mock`

## 4. Existing Tests

Current automated test coverage is small.

Present tests:

- `tests/test_openai_parse.py`

What they cover:

- valid AI JSON parsing
- invalid specialization fallback
- invalid JSON fallback

What is not covered yet:

- router authorization rules
- Firestore workflow writes
- notification side effects
- verification state transitions
- training duplicate protection

When adding core backend logic, prefer adding service-level tests with Firebase calls mocked.

## 5. Utility Scripts

Scripts live in `backend/scripts/`.

### `create_admin_user.py`

Use for:

- promoting a Firebase Auth user to admin
- optionally creating the user if missing
- optionally patching Firestore profile data

Main effects:

- sets custom claim `role=admin`
- updates or creates Firestore profile with `accountType=admin`

### `migrate_user_profiles.py`

Use for:

- backfilling `users.accountType`
- backfilling `users.isTrainee`

### `migrate_lawyer_specializations.py`

Use for:

- moving old specialization fields into `legalFieldIds`
- optionally clearing legacy specialization fields

### `seed_lookups.py`

Use for:

- seeding `genders`, `cities`, `areas`, and `work_destinations`

### `seed_specializations.py`

Use for:

- seeding `specializations` from JSON

### `seed_mock_lawyers.py`

Use for:

- creating repeatable mock lawyer data
- optionally creating Firebase Auth users for them

## 6. Change Checklist

When adding or changing backend behavior, use this checklist.

### New endpoint

1. Add or update schema in `app/schemas.py`.
2. Add route in the relevant router.
3. Extract shared logic into `services/` if the logic will be reused.
4. Wrap output with `success_response()`.
5. Add or update tests.
6. Update Postman collection in `backend/docs/postman/`.
7. Update these docs if behavior or data shape changed.

### New Firestore query

1. Confirm exact field names already used in data.
2. Add composite index if query requires it.
3. Update `backend/firebase/firestore.indexes.json`.
4. Document any new collection or field contract.

### New client-direct Firestore access

1. Update `backend/firebase/firestore.rules`.
2. Make sure the rule matches the intended actor exactly.
3. Avoid granting a broader write rule than the HTTP API unless that is intentional.

### New workflow status

1. Update schema regex in `app/schemas.py`.
2. Update router authorization logic.
3. Update notification messages if needed.
4. Update frontend expectations.
5. Update docs and Postman examples.

## 7. Coding Guidelines For This Codebase

Follow the current codebase style:

- keep payload validation in Pydantic schemas
- keep route authorization explicit inside routers
- use helper functions from `firestore_service.py` for common Firestore behavior
- use `utc_now_iso()` for timestamps
- use structured Firestore logging helpers around important reads and writes
- avoid failing a core business transaction because an optional push send failed

## 8. Privacy And Logging Notes

Sensitive values handled in this backend include:

- Firebase tokens
- national ids
- lawyer license numbers
- case descriptions
- support report details
- device FCM tokens

Current safeguards:

- logger masks common sensitive key names
- unhandled exceptions return a generic 500 response
- Firebase Admin credentials are read from environment-configured path

Be careful when adding new log keys. Masking is key-name based, so a renamed sensitive field may not be masked automatically.

## 9. Practical Extension Advice

If you need to extend the backend quickly:

- add narrow schema changes first
- keep workflow-specific logic near the current router if it is not reused
- extract a service only when logic becomes shared or too long
- preserve Firestore field names already consumed by the mobile app
- treat `users`, `lawyers`, `specializations`, and notification payload shapes as shared contracts
