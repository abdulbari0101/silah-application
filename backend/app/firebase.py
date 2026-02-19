from __future__ import annotations

from functools import lru_cache
from pathlib import Path
from typing import Optional

import firebase_admin
from firebase_admin import auth, credentials, firestore, messaging, storage

from .config import settings


def init_firebase() -> firebase_admin.App:
    if firebase_admin._apps:
        return firebase_admin.get_app()

    cred_path = Path(settings.firebase_credentials)
    if cred_path.exists():
        cred = credentials.Certificate(str(cred_path))
        options: dict[str, str] = {}
        if settings.firebase_storage_bucket:
            options["storageBucket"] = settings.firebase_storage_bucket
        return firebase_admin.initialize_app(cred, options or None)

    # Fallback to default credentials (useful in GCP or emulator environments)
    return firebase_admin.initialize_app()


@lru_cache(maxsize=1)
def firestore_client() -> firestore.Client:
    init_firebase()
    return firestore.client()


@lru_cache(maxsize=1)
def auth_client() -> auth:
    init_firebase()
    return auth


@lru_cache(maxsize=1)
def messaging_client() -> messaging:
    init_firebase()
    return messaging


@lru_cache(maxsize=1)
def storage_bucket() -> Optional[storage.bucket.Bucket]:
    init_firebase()
    try:
        return storage.bucket()
    except Exception:
        return None
