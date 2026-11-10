# Albo for your AI

Connect [Albo](https://albo.inc) — your personal library of saved places, recipes, films and books, and your Albo brain — to Gemini, Claude, Codex, Cursor, ChatGPT and any other MCP-compatible AI.

The **Albo brain** is a second brain of Markdown pages (compiled truth plus an append-only timeline, joined by `[[links]]`) shared across every AI you use, with personal and team brains. Brain tools appear on the connector for members of an Albo team.

**One-prompt install:** paste this into your AI coding assistant:

> Fetch https://mcp.albo.inc/install.md and follow the instructions to connect Albo.

## Gemini CLI

Install the Albo extension:

```bash
gemini extensions install https://github.com/thesortdapp/albo
```

Restart Gemini CLI, then authenticate the bundled MCP server:

```text
/mcp auth albo
```

Complete the browser sign-in and run `/mcp list` to verify the connection. The
extension also includes `find`, `save`, `organize`, `plan` and `recommend` library skills,
plus `brain`, `remember`, `team-skills`, `tidy` and `think` brain skills, which Gemini
activates when they match your request.

## Claude Code

Install the plugin (MCP connection plus the library and brain skills below):

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

## ChatGPT

Albo is packaged as a ChatGPT and Codex plugin under `plugins/albo`. The package
contains the remote MCP connection plus skills for saving, finding, and planning.

Until the public directory listing is approved, connect it in ChatGPT developer
mode using `https://mcp.albo.inc/mcp`. Submission copy and review cases live in
`plugins/albo/docs/openai-submission.md`.

## Claude Desktop / claude.ai / mobile

**Plugin (connector + skills):** on claude.ai or the Claude desktop app, open
[Customize → Plugins](https://claude.ai/customize/plugins) → **Add** → **Add marketplace**,
paste `https://github.com/thesortdapp/albo`, then install **albo** and sign in to the
connector when asked.

**Fallback, a zip:** download `albo-plugin-<version>.zip` from the
[latest release](https://github.com/thesortdapp/albo/releases/latest) (or build it with
`scripts/build-plugin-zip.sh`), then **Add** → **Upload plugin** and choose the zip.

Plugins can't be added from the iPhone app; add it on the web or desktop and its
skills and connector then work in mobile chats too.

**Connector only:** Settings → **Connectors** → **Add custom connector** → paste `https://mcp.albo.inc/mcp` → Connect and sign in. Connectors sync across web, desktop and mobile.

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
- **Analyse videos** — "Watch the TikTok I saved and explain the technique" (requires an AI host with video download and analysis support)
- **Plan** — "Plan a weekend in Copenhagen using my saved places"
- **Ask your brain** — "What did we decide about the Lisbon offsite?" (Albo team members)
- **Remember** — "We're going with Lisbon, Ana owns the venue" is saved to your brain as it's decided

## Bundled workflows

| Workflow | Gemini CLI | Claude Code | What it does |
| --- | --- | --- | --- |
| Save | `save` skill | `/albo:save` | Save a URL, place, recipe or note into your library |
| Find | `find` skill | `/albo:find` | Search your saves with smart filters |
| Organize | `organize` skill | automatic | Add or remove items and maintain collection memories |
| Plan | `plan` skill | `/albo:plan` | Build itineraries from your saved places and write them back to Albo |
| Recommend | `recommend` skill | `/albo:recommend` | Suggest new films, shows, books and more from everything you've finished and how you rated it |

### Brain skills

These need the Albo brain tools, which the connector offers to members of an Albo team. Without them the skills stay quiet.

| Skill | Gemini CLI | Claude Code | Triggers on |
| --- | --- | --- | --- |
| Brain | `brain` skill | automatic | You mention a place, plan, saved thing, person, project or past decision: checks the brain first (`search`, `query`, `get_page`), cites page slugs, and says when the brain has nothing |
| Remember | `remember` skill | automatic | You decide, learn or change something lasting: saves it straight away (`remember`, `put_page`, `add_timeline_entry`) as compiled truth plus a sourced timeline entry with `[[links]]`. Never saves health, family, money or other private matters unless asked, and never to a team brain |
| Team skills | `team-skills` skill | automatic | A task matches one of your team's skills: `list_skills`, then `get_skill`, then follows its steps |
| Tidy | `tidy` skill | `/albo:tidy` | "Tidy my brain" or a scheduled run: previews orphans, contradictions, stale pages, duplicates and broken links read-only, then fixes only what you approve |
| Think | `think` skill | `/albo:think` | Deeper "why", "how has it changed", "what are we missing" questions: `synthesize` or `think` for a cited answer across many pages |

## Fallback zip

`scripts/build-plugin-zip.sh` builds `dist/albo-plugin-<version>.zip` from
`plugins/albo` with `.claude-plugin/plugin.json` at the zip root, ready for
**Upload plugin** on claude.ai or the desktop app. Attach it to each GitHub release.

## Support

support@albo.inc · https://albo.inc
