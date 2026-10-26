---
name: find
description: Search the user's Albo library — saved places, recipes, films, books, articles. Use when the user asks "what did I save…", "find that restaurant…", "what's on my wishlist", or similar.
---

# Find in Albo

Search the user's saved items with the Albo MCP tools.

## Steps

1. Translate the request into a `searchExtracts` query:
   - Free text → `query`
   - Category ("restaurants", "films") → `extractTypes` (use `getAvailableFilters` to see valid types)
   - "wishlist" → `isWishlisted: true`; "done/watched/visited" → `isDone: true`
   - Vibes/cuisines/themes → look up tags first with `searchTags`, then filter with `tagNames`
   - Ratings ("my favourites") → `minRating`
2. If the user names a collection, use `listCollections` to resolve it before applying its ID as `collectionId`.
3. For location questions ("saved places near Shoreditch"), use `geocodeLocation` then `searchPlacesNearby`.
4. Use `searchImports` when the user asks for saved links, source imports, or markdown documents rather than extracted items.
5. Present results concisely: name, type, a one-line hook, and rating/tags when relevant. Offer to drill into any item with `getExtract`.
6. If nothing matches, loosen filters once before reporting no results, and say what you searched.

## Notes

- Paginate rather than dumping everything; ask before fetching more pages.
- For "what should I try next, based on what I've liked?" use the `recommend` skill (`getTasteHistory`). For brand-new ideas from what similar people saved, use `getRecommendations`.
