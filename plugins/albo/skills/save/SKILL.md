---
name: save
description: Save a link, place, recipe, film, book or note to the user's Albo library. Use when the user shares a URL or asks to save/remember/bookmark something into Albo.
---

# Save to Albo

Save content into the user's Albo library using the Albo MCP tools.

## Steps

1. Work out what the user wants to save:
   - **A URL** (TikTok, Instagram, YouTube, article, recipe page, …) → use `manageImports` with the create/import action so Albo's pipeline extracts the content automatically.
   - **A described item without a URL** (e.g. "remember this restaurant: Padella in London") → create a markdown document via `manageImports` capturing the details, or check `getAvailableFilters` for supported extract types first.
2. If the user mentions a collection ("save it to my Tokyo trip"), find the collection with `manageCollection` (action: `list`) and add the resulting item to it (action: `addItems`).
3. Confirm to the user what was saved and where. If extraction is asynchronous, say it may take a minute to appear in the app.

## Notes

- If a save fails because the item already exists, tell the user it's already in their library and offer to find it (`manageExtracts` query).
- Never invent extract types — check `getAvailableFilters` when unsure.
