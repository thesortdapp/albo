# Albo for Claude

Connect [Albo](https://albo.inc) to Claude to find saved places, recipes, films,
books, links, and documents; save new content; organize collections; and build
plans from your library.

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

- Find the restaurants I saved near Soho.
- Save this link to my Albo library.
- Plan a weekend using my saved places.
- Organize these saves into a private collection.

The bundled skills are `find`, `save`, `organize`, and `plan`. They use the declared
Albo connector; the plugin includes no local executable hooks or launchers.
It cannot make reservations or delete your entire library.

## Data handling

Tool calls send requested searches, filters, location text or coordinates,
identifiers, URLs, and any supplied document or memory text to Albo. Requested
saved content and collection memories return to Claude. The connector does not
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
