---
name: plan
description: Build an itinerary or plan from the user's saved Albo places — day plans, trip itineraries, date nights, food crawls. Use when the user asks to plan something using their saves.
---

# Plan with Albo

Turn the user's saved places into a concrete plan or itinerary.

## Steps

1. Clarify the basics if missing: where, when/how long, and any constraints (budget, dietary, with kids, etc.). One short question max — otherwise make sensible assumptions and state them.
2. Gather candidates:
   - `geocodeLocation` for the destination, then `searchPlacesNearby` for saved places in the area.
   - `manageExtracts` (query, `isWishlisted: true`, relevant `extractTypes`/`tagNames`) for wishlist items that fit.
   - `manageCollection` if the user names a collection (e.g. "my Tokyo list").
3. Build the plan: group by day and neighbourhood to minimise back-and-forth travel, alternate meals/activities sensibly, and note opening-hours caveats as assumptions to verify.
4. Offer to save the finished plan back into Albo as a markdown document via `manageImports` with `action: "createMarkdown"` so it shows up in the user's app.
5. If a collection for the trip exists, offer to add any newly relevant items to it.

## Notes

- Prefer the user's own saves over generic suggestions; only suggest non-saved fillers when there's an obvious gap, and label them clearly.
- Use `manageCollectionMemory` to recall/save durable preferences about a trip collection (e.g. "vegetarian", "no museums").
