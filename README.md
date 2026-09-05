# Gaaaavin/homebrew-tap

Personal Homebrew tap.

## openchamber-xinhao

Ad-hoc-signed macOS (Apple Silicon) build of [Gaaaavin/openchamber](https://github.com/Gaaaavin/openchamber),
a personal fork of OpenChamber. The cask is rewritten by that repo's release
workflow; do not edit `Casks/openchamber-xinhao.rb` by hand.

```bash
brew tap Gaaaavin/tap
echo 'export HOMEBREW_CASK_OPTS="--no-quarantine"' >> ~/.zshrc   # required, also for upgrades
brew uninstall --cask openchamber        # if the upstream cask is installed
brew install --cask openchamber-xinhao
brew upgrade                             # later
```

Switch back to upstream: `brew uninstall --cask openchamber-xinhao && brew install --cask openchamber`.
