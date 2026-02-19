from __future__ import annotations

import json
from typing import Iterable

import requests

from ..config import settings
from ..schemas import AIClassifyResponse


class OpenAIClassifier:
    def __init__(self) -> None:
        self.api_key = settings.openai_api_key
        self.model = settings.openai_model
        self.endpoint = settings.openai_endpoint
        self.timeout = settings.openai_timeout_seconds
        self.max_tokens = settings.openai_max_tokens
        self.temperature = settings.openai_temperature

    def classify(self, case_text: str, specializations: Iterable[str]) -> AIClassifyResponse:
        allowed = [s for s in specializations if s]
        if not self.api_key or not allowed:
            return AIClassifyResponse(
                specialization="unknown",
                confidence=0.0,
                reason="missing_api_key_or_specializations",
            )

        system_prompt = (
            "You are a legal specialization classifier. "
            "Return a JSON object with keys: specialization, confidence, reason. "
            "specialization must be one of the provided list. "
            "confidence must be between 0 and 1."
        )
        user_prompt = (
            "Case description (Arabic):\n"
            f"{case_text}\n\n"
            "Allowed specializations:\n"
            + "\n".join(f"- {s}" for s in allowed)
        )

        payload = {
            "model": self.model,
            "messages": [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ],
            "temperature": self.temperature,
            "max_tokens": self.max_tokens,
            "response_format": {"type": "json_object"},
        }

        try:
            response = requests.post(
                self.endpoint,
                headers={
                    "Authorization": f"Bearer {self.api_key}",
                    "Content-Type": "application/json",
                },
                json=payload,
                timeout=self.timeout,
            )
            response.raise_for_status()
            data = response.json()
            content = _extract_content(data)
            return _parse_ai_content(content, allowed)
        except Exception:
            return AIClassifyResponse(
                specialization="unknown",
                confidence=0.0,
                reason="classification_failed",
            )


def _extract_content(data: dict) -> str:
    try:
        return data["choices"][0]["message"]["content"]
    except Exception:
        return ""


def _parse_ai_content(content: str, allowed: list[str]) -> AIClassifyResponse:
    try:
        payload = json.loads(content)
        specialization = str(payload.get("specialization", "")).strip()
        confidence = float(payload.get("confidence", 0.0))
        reason = str(payload.get("reason", ""))
    except Exception:
        return AIClassifyResponse(
            specialization="unknown",
            confidence=0.0,
            reason="invalid_json",
        )

    if specialization not in allowed:
        specialization = "unknown"
    if confidence < 0 or confidence > 1:
        confidence = 0.0

    return AIClassifyResponse(
        specialization=specialization,
        confidence=confidence,
        reason=reason or "ok",
    )
