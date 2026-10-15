-- Catalog discovery base URL override.
--
-- Some vendors expose chat through an Anthropic-format endpoint that does not implement
-- GET /models (z.ai's api/anthropic/v1 is one: it 405s), while their OpenAI-format base
-- does serve a model list. A provider's chat api_format therefore cannot always double
-- as its catalog source. `catalog_base_url` decouples the two: when set, model sync and
-- connection tests list models from this URL instead of the chat base URL. NULL keeps
-- the previous behavior (catalog follows the chat endpoint).
ALTER TABLE llm_providers ADD COLUMN IF NOT EXISTS catalog_base_url TEXT;
