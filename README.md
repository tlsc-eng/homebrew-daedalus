# tlsc-eng/homebrew-daedalus

Homebrew tap for [Daedalus](https://github.com/tlsc-eng/daedalus), a personal macOS IDE (formerly Athena).

```sh
brew tap tlsc-eng/daedalus
brew install --cask daedalus
```

Apple silicon, macOS 26 or later. The app is ad-hoc signed (no Developer ID yet), so the cask clears its quarantine flag after install.

Upgrading from Athena: `brew update && brew upgrade --cask daedalus`. `cask_renames.json` maps the old `athena` token to `daedalus`. If Homebrew refuses the tap redirect, reinstall by hand: `brew uninstall --cask athena`, `brew untap tlsc-eng/athena`, then the two commands above.

`Casks/daedalus.rb` is written by `scripts/release.sh` in the Daedalus repository; do not edit it by hand.
