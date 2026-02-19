from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    app_env: str = Field(default="dev", validation_alias="SILAH_APP_ENV")
    allowed_origins: str = Field(default="*", validation_alias="SILAH_ALLOWED_ORIGINS")

    firebase_credentials: str = Field(
        default="env/firebase-service-account.json",
        validation_alias="SILAH_FIREBASE_CREDENTIALS",
    )
    firebase_project_id: str | None = Field(
        default=None,
        validation_alias="SILAH_FIREBASE_PROJECT_ID",
    )
    firebase_storage_bucket: str | None = Field(
        default=None,
        validation_alias="SILAH_FIREBASE_STORAGE_BUCKET",
    )

    openai_api_key: str | None = Field(default=None, validation_alias="SILAH_OPENAI_API_KEY")
    openai_model: str = Field(default="gpt-4o-mini", validation_alias="SILAH_OPENAI_MODEL")
    openai_endpoint: str = Field(
        default="https://api.openai.com/v1/chat/completions",
        validation_alias="SILAH_OPENAI_ENDPOINT",
    )
    openai_timeout_seconds: int = Field(default=20, validation_alias="SILAH_OPENAI_TIMEOUT_SECONDS")
    openai_max_tokens: int = Field(default=200, validation_alias="SILAH_OPENAI_MAX_TOKENS")
    openai_temperature: float = Field(default=0.0, validation_alias="SILAH_OPENAI_TEMPERATURE")

    allow_mock_najiz: bool = Field(default=True, validation_alias="SILAH_ALLOW_MOCK_NAJIZ")

    model_config = SettingsConfigDict(env_file=".env", case_sensitive=False)


settings = Settings()
