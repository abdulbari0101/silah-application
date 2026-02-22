from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[2]
BACKEND_DIR = Path(__file__).resolve().parents[1]
sys.path.append(str(BACKEND_DIR))

from app.firebase import firestore_client  # noqa: E402


COLLECTION_MAP = {
    "genders": "genders",
    "cities": "cities",
    "areas": "areas",
    "workDestinations": "work_destinations",
}


def load_payload(source: Path) -> dict:
    data = json.loads(source.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise ValueError("Lookups JSON must be an object with lists")
    return data


def chunked(items: Iterable, size: int) -> Iterable[list]:
    batch: list = []
    for item in items:
        batch.append(item)
        if len(batch) >= size:
            yield batch
            batch = []
    if batch:
        yield batch


def clear_collection(db, collection_name: str) -> None:
    docs = list(db.collection(collection_name).stream())
    for chunk in chunked(docs, 450):
        batch = db.batch()
        for doc in chunk:
            batch.delete(doc.reference)
        batch.commit()


def seed_collection(db, collection_name: str, items: list[dict], dry_run: bool) -> int:
    created = 0
    for item in items:
        doc_id = item.get("id")
        if not doc_id:
            raise ValueError(f"Missing id in {collection_name} item: {item}")

        payload = dict(item)
        payload["id"] = doc_id

        if dry_run:
            print(f"Dry run: would upsert {collection_name}/{doc_id} -> {payload}")
            created += 1
            continue

        db.collection(collection_name).document(doc_id).set(payload, merge=True)
        created += 1
    return created


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Seed Firestore lookup collections.")
    parser.add_argument(
        "--source",
        type=str,
        default=str(ROOT / "docs" / "mock" / "lookups.json"),
        help="Path to lookups JSON file.",
    )
    parser.add_argument(
        "--clear",
        action="store_true",
        help="Delete existing lookup documents before seeding.",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print actions without writing to Firestore.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    source = Path(args.source)
    if not source.exists():
        raise FileNotFoundError(f"Source file not found: {source}")

    payload = load_payload(source)
    db = firestore_client()

    total = 0
    for key, collection in COLLECTION_MAP.items():
        items = payload.get(key) or []
        if not isinstance(items, list):
            raise ValueError(f"Expected list for {key} in lookups JSON")

        if args.clear and not args.dry_run:
            clear_collection(db, collection)
        elif args.clear and args.dry_run:
            print(f"Dry run: would clear {collection}")

        created = seed_collection(db, collection, items, args.dry_run)
        total += created

    print(f"Seeded {total} lookup records from {source}")


if __name__ == "__main__":
    main()
