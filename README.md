# Albo for your AI

Connect [Albo](https://albo.inc) — your personal library of saved places, recipes, films and books — to Claude, Codex, Cursor, ChatGPT and any other MCP-compatible AI.

**One-prompt install:** paste this into your AI coding assistant:

> Fetch https://mcp.albo.inc/install.md and follow the instructions to connect Albo.

## Claude Code

Install the plugin (MCP connection + `/albo:save`, `/albo:find`, `/albo:plan` skills):

```bash
claude plugin marketplace add thesortdapp/albo
claude plugin install albo@albo
```

Or just the MCP server:

```bash
claude mcp add --transport http albo https://mcp.albo.inc/mcp
```

Sign in with your Albo account (Google or Apple) when prompted.

## Codex

```bash
codex mcp add albo --url https://mcp.albo.inc/mcp
codex mcp login albo
```

## Claude Desktop / claude.ai / mobile

Settings → **Connectors** → **Add custom connector** → paste `https://mcp.albo.inc/mcp` → Connect and sign in. Connectors sync across web, desktop and mobile.

## Cursor

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "albo": { "url": "https://mcp.albo.inc/mcp" }
  }
}
```

## What you can do

- **Save** — "Save this TikTok to Albo", "Remember this restaurant for my Lisbon trip"
- **Find** — "What sushi places have I saved near Soho?", "What's on my film wishlist?"
- **Plan** — "Plan a weekend in Copenhagen using my saved places"

## Skills (Claude Code plugin)

| Skill | What it does |
| --- | --- |
| `/albo:save` | Save a URL, place, recipe or note into your library |
| `/albo:find` | Search your saves with smart filters |
| `/albo:plan` | Build itineraries from your saved places and write them back to Albo |

## Support

support@albo.inc · https://albo.inc
