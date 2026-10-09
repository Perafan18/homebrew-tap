# Perafan18/homebrew-tap

Homebrew formulae for [Standfast](https://github.com/Perafan18/standfast), a macOS menu bar
app for self-hosted GitHub Actions runners.

```sh
brew install perafan18/tap/standfast
```

The formula builds Standfast on your Mac, so it needs Xcode 16 or later. Spotlight and
Launchpad do not look inside Homebrew's Cellar, so copy the app into Applications after
installing, and again after every upgrade:

```sh
rm -rf /Applications/Standfast.app
ditto "$(brew --prefix standfast)/Standfast.app" /Applications/Standfast.app
open /Applications/Standfast.app
```

The formula's source of truth is `Formula/standfast.rb` in the Standfast repository; this
tap carries a copy with each release's checksum.
