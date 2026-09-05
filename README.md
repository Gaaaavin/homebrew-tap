# Gaaaavin/homebrew-tap

Personal Homebrew tap.

## openchamber-xinhao

Ad-hoc-signed macOS (Apple Silicon) build of [Gaaaavin/openchamber](https://github.com/Gaaaavin/openchamber),
a personal fork of OpenChamber. The cask is rewritten by that repo's release
workflow; do not edit the `version`/`sha256` lines of `Casks/openchamber-xinhao.rb` by hand.

The build has no Apple Developer ID, so the cask strips the quarantine
attribute after install (`postflight`) and macOS opens it without a Gatekeeper
prompt. Install it only if you trust the fork's CI.

```bash
brew tap Gaaaavin/tap
brew trust --cask gaaaavin/tap/openchamber-xinhao   # Homebrew 6 requires trusting third-party casks
brew uninstall --cask openchamber                   # if the upstream cask is installed
brew install --cask openchamber-xinhao
brew upgrade                                        # later
```

Switch back to upstream: `brew uninstall --cask openchamber-xinhao && brew install --cask openchamber`.
