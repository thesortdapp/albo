# Albo for ChatGPT, Codex and Claude

Get recommendations based on the films, shows and places you like, search your
Albo saves, and keep your next picks in private collections you can browse.
Albo also supports saving links, documents and plans.

## Install and connect

```bash
claude plugin marketplace add thesortdapp/albo
claude plugin install albo@albo
```

The plugin includes the remote Streamable HTTP MCP server at
`https://mcp.albo.inc/mcp`. Sign in with your Albo account through its OAuth flow.
Never paste passwords or tokens into a conversation. See [setup](SETUP.md) and
the [installation guide](https://mcp.albo.inc/install.md).

## Try it

- Based on the films I loved in Albo, what should I watch next?
- Find the restaurants I saved for my next trip.
- Create a private collection for these recommendations.

The bundled skills are `recommend`, `find`, `save`, `organize`, and `plan`. They use the declared
Albo connector; the plugin includes no local executable hooks or launchers.
It cannot make reservations or delete your entire library.

## Data handling

Tool calls send requested searches, filters, location text or coordinates,
identifiers, URLs, and any supplied document or memory text to Albo. Requested
saved content, taste history and collection memories return to your connected AI app.
Albo does not automatically sync this information into ChatGPT memory. The connector does not
request a complete conversation transcript or read device GPS.

Saving content, editing documents, and changing collections or memories persist
in Albo. Saved records can remain for the lifetime of the account; disconnecting
Claude does not erase them. Removing a collection item only unlinks it. Specify
private visibility when creating a private collection: the service otherwise
defaults to friends visibility.

Albo uses infrastructure and processing providers described in its privacy
policy. Depending on the operation, these include source retrieval providers and
AI services for content extraction or location lookup. Operational logs may
contain failed tool parameters. Provider and backup retention differs from
saved-record retention. Review the [privacy policy](https://albo.inc/privacy-policy)
for the complete disclosures, retention periods, and deletion controls.

## Support and terms

Contact [support@albo.inc](mailto:support@albo.inc) for connection problems or
privacy requests. Albo's [terms of service](https://albo.inc/terms-of-service)
apply to the connected service.
