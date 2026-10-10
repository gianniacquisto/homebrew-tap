# Gianni Acquisto's Homebrew Tap

Formulae for my projects.

## [tandem](https://github.com/gianniacquisto/tandem)

A native macOS todo app shared by humans and agents on the same Mac.

```sh
brew install gianniacquisto/tap/tandem
```

Installs:

- `tandem` — the app (main window + menu bar item)
- `tandem-mcp` — the MCP stdio server that agents use to read and write the same todos

Builds from source; requires macOS 26+ and the Xcode Command Line Tools.

## Developing

The tap is a plain git repository — this one. brew only reads taps from its fixed tap directory, so develop where brew keeps the clone:

```sh
brew tap gianniacquisto/tap
cd "$(brew --repository gianniacquisto/homebrew-tap)"
```

That directory is an ordinary git clone of this repo: branch, commit, push from there. `brew update` keeps it current, and formula edits are picked up by brew immediately — no push needed to test locally.

Before pushing formula changes:

```sh
brew style Formula/tandem.rb
brew audit --strict gianniacquisto/tap/tandem
brew install --build-from-source gianniacquisto/tap/tandem
```

Version bumps: the `autobump` workflow watches the project repos for new tags and opens bump PRs automatically.

## Documentation

`brew help`, `man brew`, or check [Homebrew's documentation](https://docs.brew.sh).
