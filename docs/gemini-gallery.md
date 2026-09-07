# Gemini CLI extension gallery release

Google discovers Gemini CLI extensions automatically. There is no application
form or pull request for the gallery.

## Release checklist

1. Validate the repository root with `gemini extensions validate .`.
2. Merge the extension files to the public repository's default branch.
3. Add the `gemini-cli-extension` topic to `thesortdapp/albo` on GitHub.
4. Tag the commit with the same version as `gemini-extension.json` and publish a
   non-draft, non-prerelease GitHub release marked as the latest release.
5. Test a clean install with
   `gemini extensions install https://github.com/thesortdapp/albo`.
6. Restart Gemini CLI, run `/mcp auth albo`, complete Albo sign-in, and verify
   the tools with `/mcp list`.
7. Allow the gallery's daily crawler to index and validate the tagged release.

## Compatibility requirements

- The extension uses Gemini's `httpUrl` setting for Streamable HTTP.
- OAuth discovery is enabled; the Albo MCP advertises protected-resource and
  authorization-server metadata, dynamic client registration, PKCE, refresh
  tokens, and RFC 9207 issuer identification.
- OAuth redirects use `http://localhost:<random-port>/oauth/callback`, which the
  Albo authorization server permits through loopback redirect matching.
