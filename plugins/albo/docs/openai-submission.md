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
- Short description: **Save, find, and plan with your Albo library**
- Long description: **Connect your personal Albo library to save links and notes, search saved places, recipes, films and books, and build plans using the things you already love.**
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
| `manageCollection` | No | No | Yes | Creates and changes collections. A collection can be created with public visibility, so the conservative public-state annotation is used. Removing an item from a collection is reversible by adding it again. |
| `manageExtracts` | Yes | No | No | Searches and retrieves the authenticated user's saved items without changing state. |
| `manageImports` | No | Yes | No | Saves URLs, creates documents, and can overwrite an existing markdown document. Changes stay inside the authenticated user's Albo library. |
| `getAvailableFilters` | Yes | No | No | Lists valid filter values without changing state. |
| `geocodeLocation` | Yes | No | No | Looks up coordinates for a user-supplied place name without changing external state. |
| `searchPlacesNearby` | Yes | No | No | Searches the authenticated user's saved places without changing state. |
| `searchTags` | Yes | No | No | Searches the authenticated user's tags without changing state. |
| `getRecommendations` | Yes | No | No | Retrieves recommendations without changing state. |
| `manageCollectionMemory` | No | Yes | No | Saves and deletes collection memories. Deleting a memory is irreversible. |

## Positive review cases

### 1. Search saved places

- Prompt: **Find the restaurants I saved near Soho.**
- Expected behavior: Geocode Soho, search the authenticated user's nearby saved places, and return concise matching restaurants.
- Expected tools: `geocodeLocation`, then `searchPlacesNearby`.
- Fixture: The reviewer account contains at least two saved restaurants within the configured radius of Soho.

### 2. Search a film wishlist

- Prompt: **What's on my film wishlist?**
- Expected behavior: Query saved film items with the wishlist filter and summarize the results without changing data.
- Expected tool: `manageExtracts` with the `query` action, film extract type, and `isWishlisted: true`.
- Fixture: The reviewer account contains at least three wishlisted films.

### 3. Save a URL

- Prompt: **Save this recipe to Albo: <review fixture URL>.**
- Expected behavior: Save the supplied URL, report that extraction may still be processing, and avoid claiming extracted details before processing finishes.
- Expected tool: `manageImports` with the `uploadUrl` action.
- Fixture: Use a stable public recipe URL that has not already been saved by the reviewer account.

### 4. Build a trip plan

- Prompt: **Plan a Saturday in Paris using places I've already saved.**
- Expected behavior: Find saved Paris places, group them into a practical day plan, label opening hours as needing verification, and prefer saved items over generic suggestions.
- Expected tools: `geocodeLocation`, `searchPlacesNearby`, and optionally `manageExtracts`.
- Fixture: The reviewer account contains saved places in at least two Paris neighborhoods.

### 5. Save a completed plan

- Prompt: **Save that Paris plan back to my Albo library.**
- Expected behavior: Create a markdown document containing the plan and confirm where it was saved.
- Expected tool: `manageImports` with the `createMarkdown` action.
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

Initial public release of Albo for ChatGPT and Codex. The plugin connects to a user's personal Albo library over OAuth and provides workflows for saving links and notes, finding saved places and media, and planning with saved content. This release has no custom UI.

## Portal-only owner decisions

- Select only countries where Albo, its support process, and its legal terms are available.
- Select the verified Albo business identity.
- Provide reviewer credentials securely in the portal.
- Review the live MCP scan and resolve every warning before submitting.
