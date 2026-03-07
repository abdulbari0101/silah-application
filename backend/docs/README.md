# SILAH Backend Developer Docs

This folder documents the current FastAPI backend implementation in `backend/app`.
It is aimed at developers who need to understand both:

- the code structure: where logic lives and how requests move through the app
- the workflow logic: what each endpoint reads, validates, writes, and triggers

## Read In This Order

1. `code-architecture.md`
2. `business-flows.md`
3. `firestore-schema.md`
4. `development-guide.md`
5. `postman/`

## Quick Summary

- Runtime: FastAPI + Firebase Admin
- Storage: Firestore
- Push notifications: Firebase Cloud Messaging
- Authentication: Firebase ID token in `Authorization: Bearer <token>`
- AI routing: OpenAI Chat Completions API via `requests`
- Response envelope: every API response includes `Result`

Public endpoints:

- `GET /health`
- `GET /lookups/genders`
- `GET /lookups/cities`
- `GET /lookups/areas`
- `GET /lookups/work-destinations`

Protected endpoints:

- everything else

## Current Design Characteristics

- The backend is small and pragmatic. Shared helpers live in `services/`, but several workflow rules still live directly inside router files.
- Firestore is part of the runtime contract, not only a storage detail. Collection names, document ids, and field names matter to both backend and mobile app behavior.
- Lawyer verification is currently a deterministic mock in code. There is no live Najiz integration yet.
- AI classification is recommendation/routing only. If OpenAI is unavailable or parsing fails, the backend falls back to `unknown`.

## Document Map

- `code-architecture.md`
  Code layout, request lifecycle, router ownership, and cross-cutting patterns.

- `business-flows.md`
  Feature-by-feature logic for auth, AI, verification, consultations, training, notifications, and support.

- `firestore-schema.md`
  Collection structure, document id strategy, security rules, and required indexes.

- `development-guide.md`
  Local setup, environment variables, test commands, utility scripts, and change checklist.

- `postman/`
  Existing Postman collections for manual API testing.

## Minimal Local Start

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

## Recommended Reading In Code

- `app/main.py`
- `app/auth.py`
- `app/schemas.py`
- `app/routers/*.py`
- `app/services/firestore_service.py`
- `app/services/openai_client.py`
- `app/services/verification.py`
- `firebase/firestore.rules`
- `firebase/firestore.indexes.json`
