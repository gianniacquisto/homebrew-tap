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

The formula also builds the GUI app bundle (`share/Tandem.app`); the [cask](Casks/tandem.rb) links it into `/Applications`, where Launchpad and Spotlight find it:

```sh
brew install --cask gianniacquisto/tap/tandem
```

One build, one upgrade path: `brew upgrade tandem` keeps both current (the cask only depends on the formula — [ADR 0002](https://github.com/gianniacquisto/tandem/blob/main/docs/adr/0002-app-distribution.md)).

Builds from source; requires macOS 26+ and the Xcode Command Line Tools.

## Developing

The tap is a plain git repository — this one. brew only reads taps from its fixed tap directory, so develop where brew keeps the clone:

```sh
brew tap gianniacquisto/tap
cd "$(brew --repository gianniacquisto/homebrew-tap)"
```

That directory is an ordinary git clone of this repo: branch, commit, push from there. `brew update` keeps it current, and formula edits are picked up by brew immediately — no push needed to test locally.

Before pushing formula or cask changes:

```sh
brew style Formula/tandem.rb Casks/tandem.rb
brew audit --strict --formula gianniacquisto/tap/tandem
brew audit --cask --strict gianniacquisto/tap/tandem
brew test gianniacquisto/tap/tandem
brew install --build-from-source gianniacquisto/tap/tandem
brew install --cask gianniacquisto/tap/tandem
```

Version bumps: the `autobump` workflow watches the project repos for new tags and opens bump PRs automatically (it bumps formula and cask together — they share a release). It needs the `HOMEBREW_GITHUB_API_TOKEN` repo secret (a token with `repo` scope); without a working token the run fails after pushing the bump branch, so the PR has to be opened by hand.

## Documentation

`brew help`, `man brew`, or check [Homebrew's documentation](https://docs.brew.sh).
