from app.services.openai_client import _parse_ai_content


def test_parse_valid_content():
    content = '{"specialization":"Criminal Law","confidence":0.9,"reason":"match"}'
    result = _parse_ai_content(content, ["Criminal Law", "Family Law"])
    assert result.specialization == "Criminal Law"
    assert result.confidence == 0.9
    assert result.reason == "match"


def test_parse_invalid_specialization():
    content = '{"specialization":"Unknown Law","confidence":0.5,"reason":"no"}'
    result = _parse_ai_content(content, ["Criminal Law", "Family Law"])
    assert result.specialization == "unknown"


def test_parse_invalid_json():
    result = _parse_ai_content("not-json", ["Criminal Law"])
    assert result.specialization == "unknown"
    assert result.confidence == 0.0
