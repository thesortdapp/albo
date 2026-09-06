---
name: save
description: Save a link, place, recipe, film, book or note to the user's Albo library. Use when the user shares a URL or asks to save/remember/bookmark something into Albo.
---

# Save to Albo

Save content into the user's Albo library using the Albo MCP tools.

## Steps

1. Work out what the user wants to save:
   - **A URL** (TikTok, Instagram, YouTube, article, recipe page, …) → use `saveImport` with `action: "uploadUrl"` so Albo's pipeline extracts the content automatically.
   - **A described item without a URL** (e.g. "remember this restaurant: Padella in London") → use `saveImport` with `action: "createMarkdown"` to capture the details, or check `getAvailableFilters` for supported extract types first.
2. If the user mentions a collection ("save it to my Tokyo trip"), resolve it with `findCollections`, then use `changeCollection` with `action: "addItems"` after the save returns an item ID.
3. Confirm to the user what was saved and where. If extraction is asynchronous, say it may take a minute to appear in the app.

## Notes

- If a save deduplicates onto an existing import, say it was already saved instead of claiming a duplicate was created.
- If a save fails because the item already exists, offer to find it with `findExtracts` or `findImports`.
- Never invent extract types — check `getAvailableFilters` when unsure.
- Do not edit an existing markdown document unless the user clearly asked to replace its content.
