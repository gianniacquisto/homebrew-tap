# Gianni Acquisto's Homebrew Tap

Casks for my projects.

## [tandem](https://github.com/gianniacquisto/tandem)

A native macOS todo app shared by humans and agents on the same Mac.

```sh
brew install --cask gianniacquisto/tap/tandem
```

Installs `Tandem.app` (main window + menu bar item) into `/Applications`, where Launchpad and Spotlight find it. The MCP stdio server that agents use to read and write the same todos ships inside the app bundle.

Requires macOS 27+ (Apple silicon).

## Developing

The tap is a plain git repository — this one. brew only reads taps from its fixed tap directory, so develop where brew keeps the clone:

```sh
brew tap gianniacquisto/tap
cd "$(brew --repository gianniacquisto/homebrew-tap)"
```

That directory is an ordinary git clone of this repo: branch, commit, push from there. `brew update` keeps it current, and cask edits are picked up by brew immediately — no push needed to test locally.

Before pushing cask changes:

```sh
brew style Casks/tandem.rb
brew audit --cask --strict gianniacquisto/tap/tandem
brew install --cask gianniacquisto/tap/tandem
```

Version bumps: the `autobump` workflow watches the project for new releases and opens a bump PR for the single cask file automatically (its livecheck targets the project's release assets). It needs the `HOMEBREW_GITHUB_API_TOKEN` repo secret (a token with `repo` scope); without a working token the run fails after pushing the bump branch, so the PR has to be opened by hand.

## Documentation

`brew help`, `man brew`, or check [Homebrew's documentation](https://docs.brew.sh).
