# Albo extension

Albo is the user's personal library of saved places, recipes, films, books,
articles, links, and notes. Use the Albo MCP tools whenever the user asks to
find, save, organize, recommend, or plan with their Albo library.

- Prefer the user's own saves over generic web results.
- Use read-only discovery tools before changing collections or documents.
- Only use write actions when the user has asked for the corresponding change.
- Never invent saved items, IDs, ratings, tags, or collection membership.
- Report what changed and distinguish adding an item to a collection from
  deleting it from the library.
- If Albo is not authenticated, tell the user to run `/mcp auth albo` and
  complete the browser sign-in. Never ask them to paste a token into chat.

Detailed workflows are available as the bundled `find`, `save`, `organize`, and
`plan` skills.
