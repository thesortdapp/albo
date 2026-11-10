#!/usr/bin/env bash
# Builds dist/albo-plugin-<version>.zip from plugins/albo for "Upload plugin" on
# claude.ai and the Claude desktop app. The zip root holds .claude-plugin/plugin.json.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
plugin="$root/plugins/albo"
version="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$plugin/.claude-plugin/plugin.json")"

# Every version string must agree before shipping.
for f in "$root/.claude-plugin/marketplace.json" "$plugin/.codex-plugin/plugin.json" "$root/gemini-extension.json"; do
  grep -q "\"version\": \"$version\"" "$f" || { echo "Version mismatch: $f is not $version" >&2; exit 1; }
done

# The root skills/ folder (Gemini) must mirror the plugin's skills.
diff -r -x agents "$root/skills" "$plugin/skills" >/dev/null || { echo "skills/ and plugins/albo/skills/ differ" >&2; exit 1; }

out="$root/dist/albo-plugin-$version.zip"
mkdir -p "$root/dist"
rm -f "$out"
(cd "$plugin" && zip -qrX "$out" . -x '.DS_Store' -x '*/.DS_Store')

# Attach BOTH files to the GitHub release. Gemini CLI installs a release's asset
# when it is the only one, and this zip is not a Gemini extension; with two
# assets it installs the repository source instead, which is.
(cd "$root/dist" && shasum -a 256 "$(basename "$out")" > "$(basename "$out").sha256")
echo "$out"
echo "$out.sha256"
