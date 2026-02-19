from __future__ import annotations


def mock_najiz_check(license_number: str, national_id: str) -> str:
    """
    Deterministic mock:
    - ends with 0 -> rejected
    - ends with 9 -> needsReview
    - otherwise -> verified
    """
    if not license_number:
        return "needsReview"
    last_char = license_number.strip()[-1]
    if last_char == "0":
        return "rejected"
    if last_char == "9":
        return "needsReview"
    return "verified"
