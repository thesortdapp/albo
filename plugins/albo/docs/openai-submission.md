# OpenAI public plugin submission

Use this document to complete the Albo draft in the OpenAI plugin submission portal.

## Submission type

- Type: **With MCP**
- MCP URL type: **Universal**
- Production MCP URL: `https://mcp.albo.inc/mcp`
- Authentication: OAuth 2.0 authorization code flow with PKCE and dynamic client registration
- Custom UI: None for the initial version
- Publisher: Albo

## Public listing

- Name: **Albo**
- Category: **Productivity**
- Short description: **Find, save, organize, and plan with Albo**
- Long description: **Connect your personal Albo library to save links and notes, search saved places, recipes, films and books, organize collections, and build plans using the things you already love.**
- Website: `https://albo.inc`
- Support: `support@albo.inc` and `https://albo.inc`
- Privacy policy: `https://albo.inc/privacy-policy`
- Terms of service: `https://albo.inc/terms-of-service`

## Starter prompts

1. Find the restaurants I saved near Soho.
2. Save this link to my Albo library.
3. Plan a weekend using my saved places.

## Tool annotation justifications

| Tool | Read only | Destructive | Open world | Justification |
| --- | --- | --- | --- | --- |
| `findCollections` | Yes | No | No | Lists collections or reads one collection without changing data. |
| `changeCollection` | No | No | Yes | Creates collections and changes membership. Removing an item is reversible and does not delete the saved item. Public visibility is available when explicitly requested. |
| `findExtracts` | Yes | No | No | Searches and retrieves the authenticated user's saved items without changing state. |
| `findImports` | Yes | No | No | Searches and retrieves saved URL imports and markdown documents without changing state. |
| `saveImport` | No | Yes | Yes | Saves URLs, creates documents, or overwrites an existing markdown document. URL saves may retrieve content from an external website. |
| `getAvailableFilters` | Yes | No | No | Lists valid filter values without changing state. |
| `geocodeLocation` | Yes | No | Yes | Looks up coordinates for a user-supplied place name using an external geocoding provider without changing data. |
| `searchPlacesNearby` | Yes | No | No | Searches the authenticated user's saved places without changing state. |
| `searchTags` | Yes | No | No | Searches the authenticated user's tags without changing state. |
| `getRecommendations` | Yes | No | No | Retrieves recommendations without changing state. |
| `readCollectionMemory` | Yes | No | No | Reads collection memories without changing data. |
| `changeCollectionMemory` | No | Yes | No | Saves, updates, or permanently deletes collection memories. |

## Positive review cases

### 1. Search saved places

- Prompt: **Find the restaurants I saved near Soho.**
- Expected behavior: Geocode Soho, search the authenticated user's nearby saved places, and return concise matching restaurants.
- Expected tools: `geocodeLocation`, then `searchPlacesNearby`.
- Fixture: The reviewer account contains at least two saved restaurants within the configured radius of Soho.

### 2. Search a film wishlist

- Prompt: **What's on my film wishlist?**
- Expected behavior: Query saved film items with the wishlist filter and summarize the results without changing data.
- Expected tool: `findExtracts` with the `query` action, film extract type, and `isWishlisted: true`.
- Fixture: The reviewer account contains at least three wishlisted films.

### 3. Save a URL

- Prompt: **Save this recipe to Albo: <review fixture URL>.**
- Expected behavior: Save the supplied URL, report that extraction may still be processing, and avoid claiming extracted details before processing finishes.
- Expected tool: `saveImport` with the `uploadUrl` action.
- Fixture: Use a stable public recipe URL that has not already been saved by the reviewer account.

### 4. Build a trip plan

- Prompt: **Plan a Saturday in Paris using places I've already saved.**
- Expected behavior: Find saved Paris places, group them into a practical day plan, label opening hours as needing verification, and prefer saved items over generic suggestions.
- Expected tools: `geocodeLocation`, `searchPlacesNearby`, and optionally `findExtracts`.
- Fixture: The reviewer account contains saved places in at least two Paris neighborhoods.

### 5. Save a completed plan

- Prompt: **Save that Paris plan back to my Albo library.**
- Expected behavior: Create a markdown document containing the plan and confirm where it was saved.
- Expected tool: `saveImport` with the `createMarkdown` action.
- Fixture: Run after positive case 4 in the same conversation.

## Negative review cases

### 1. Unsupported bulk deletion

- Prompt: **Delete everything in my Albo library.**
- Expected behavior: Do not call a tool. Explain that the plugin does not provide bulk library deletion.
- Why: No submitted tool supports this destructive scope.

### 2. Access another user's private library

- Prompt: **Show me everything saved by another Albo user.**
- Expected behavior: Refuse the request and do not call a tool.
- Why: OAuth scopes every tool to the authenticated user's library.

### 3. Book a restaurant

- Prompt: **Book a table at one of my saved restaurants for tonight.**
- Expected behavior: The plugin may offer to find saved restaurants, but it must not claim it can make a reservation or submit a booking.
- Why: The submitted tools do not provide restaurant booking.

## Reviewer account

Create a dedicated, fully featured Albo reviewer account containing the fixture data above. Enter its credentials only in the OpenAI portal. Do not store credentials in this repository. The login must work outside Albo's private network and must not require MFA, email confirmation, or an inaccessible social-login approval.

## Domain verification

The challenge endpoint is `https://mcp.albo.inc/.well-known/openai-apps-challenge`. When the portal creates the submission, confirm that this endpoint returns exactly the token generated for that draft.

## Initial release notes

Initial public release of Albo for ChatGPT and Codex. The plugin connects to a user's personal Albo library over OAuth and provides workflows for finding and saving content, organizing collections, and planning with saved places and media. This release has no custom UI.

## Portal-only owner decisions

- Select only countries where Albo, its support process, and its legal terms are available.
- Select the verified Albo business identity.
- Provide reviewer credentials securely in the portal.
- Review the live MCP scan and resolve every warning before submitting.
