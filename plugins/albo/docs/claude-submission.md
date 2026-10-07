# Claude directory submission

Submit both Albo components. The remote MCP belongs in the Connectors Directory; this public plugin belongs in the Plugin Directory.

## Remote connector

- Name: **Albo**
- MCP URL: `https://mcp.albo.inc/mcp`
- Transport: Streamable HTTP
- Authentication: OAuth 2.0 authorization code flow with PKCE (S256), dynamic client registration, refresh tokens, and revocation
- Tagline: **Find, save, organize, and plan with your Albo library**
- Documentation: `https://mcp.albo.inc/install.md`
- Website: `https://albo.inc`
- Privacy policy: `https://albo.inc/privacy-policy`
- Terms: `https://albo.inc/terms-of-service`
- Support: `support@albo.inc`
- Allowed link URI: `albo:`

The reviewer account and positive/negative cases are the same as those in `openai-submission.md`. Enter credentials only in Anthropic's submission form.

## Plugin

- Public repository: `https://github.com/thesortdapp/albo`
- Plugin path: `plugins/albo`
- Included connector: `https://mcp.albo.inc/mcp`
- Included skills: `find`, `save`, `plan`, `organize`
- Submission page: `https://claude.ai/directory/manage/new/plugin`
- Source license: MIT
- Intended audience: users aged 13 and over, including ages 13–17

Directory data-handling declarations: reads and stores personal data; the skills
use only the declared Albo connector; saved content is retained longer than 30
days; intended for users under 18. The publisher must complete the live
compliance attestations before submission.

Before submitting, run `claude plugin validate` from the public repository and exercise every MCP tool through MCP Inspector and a Claude custom connector.

## Release summary

Albo connects Claude to a user's private library of saved places, recipes, films, books, links, and documents. The plugin adds reusable workflows for finding saves, saving new content, organizing collections, and planning from the user's existing library. Read and write MCP operations are separated so Claude can apply accurate permissions and confirmations.
