from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[2]
BACKEND_DIR = Path(__file__).resolve().parents[1]
sys.path.append(str(BACKEND_DIR))

from app.firebase import firestore_client  # noqa: E402


def slugify(text: str | None) -> str | None:
    if not text:
        return None
    slug = re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")
    return slug or None


def load_specializations(source: Path) -> list[dict]:
    data = json.loads(source.read_text(encoding="utf-8"))
    if isinstance(data, dict):
        response = data.get("response") or data.get("Response") or data
        items = response.get("specializations") if isinstance(response, dict) else None
        if isinstance(items, list):
            return items
    if isinstance(data, list):
        return data
    raise ValueError("Unsupported JSON format for specializations")


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


def seed_specializations(source: Path, clear: bool, dry_run: bool) -> int:
    items = load_specializations(source)
    db = firestore_client()

    if clear:
        if dry_run:
            print("Dry run: would clear existing specializations")
        else:
            clear_collection(db, "specializations")

    used_ids: set[str] = set()
    created = 0

    for item in items:
        name_ar = (item.get("nameAr") or "").strip() or None
        name_en = (item.get("nameEn") or "").strip() or None
        active = bool(item.get("active", True))

        base_id = slugify(name_en) or slugify(name_ar)
        doc_id = None
        if base_id:
            candidate = base_id
            index = 2
            while candidate in used_ids:
                candidate = f"{base_id}-{index}"
                index += 1
            used_ids.add(candidate)
            doc_id = candidate

        icon_url = (item.get("iconUrl") or "").strip() or None
        payload = {
            "nameAr": name_ar,
            "nameEn": name_en,
            "active": active,
            "iconUrl": icon_url,
        }

        if dry_run:
            print(f"Dry run: would upsert {doc_id or '[auto-id]'} -> {payload}")
            created += 1
            continue

        collection = db.collection("specializations")
        ref = collection.document(doc_id) if doc_id else collection.document()
        ref.set(payload, merge=True)
        created += 1

    return created


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Seed Firestore specializations data.")
    parser.add_argument(
        "--source",
        type=str,
        default=str(ROOT / "docs" / "mock" / "specializations.json"),
        help="Path to the specializations JSON file.",
    )
    parser.add_argument(
        "--clear",
        action="store_true",
        help="Delete existing specializations before seeding.",
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

    created = seed_specializations(source, clear=args.clear, dry_run=args.dry_run)
    print(f"Seeded {created} specializations from {source}")


if __name__ == "__main__":
    main()
