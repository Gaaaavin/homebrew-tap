# Gaaaavin/homebrew-tap

Personal Homebrew tap.

## openchamber-xinhao

macOS (Apple Silicon) build of [Gaaaavin/openchamber](https://github.com/Gaaaavin/openchamber),
a personal fork of OpenChamber.

### Install

```bash
brew tap Gaaaavin/tap
brew trust --cask gaaaavin/tap/openchamber-xinhao
brew install --cask openchamber-xinhao
```

If the upstream cask is installed, remove it first: `brew uninstall --cask openchamber`.
If OpenChamber was installed from a DMG, delete `/Applications/OpenChamber.app` first.
Settings and sessions carry over; both use the same bundle id.

### Upgrade

```bash
brew upgrade --cask openchamber-xinhao
```

The app's Settings -> About -> Check for updates tells you when a newer fork
release exists and shows this command. `brew autoupdate start` can run it on a
timer.

### Back to upstream

```bash
brew uninstall --cask openchamber-xinhao
brew install --cask openchamber
```

### What the cask does

- `brew trust` is a Homebrew 6 requirement for casks outside the official taps;
  it is not related to macOS security.
- The build is ad-hoc signed and not notarized (no Apple Developer ID). The
  cask removes the `com.apple.quarantine` attribute after install and upgrade
  (`postflight_steps`), so macOS opens the app without a Gatekeeper prompt.
  Homebrew 6 removed `--no-quarantine`; setting `HOMEBREW_CASK_OPTS` does
  nothing. Install only if you trust the fork's CI.
- `version` and `sha256` in `Casks/openchamber-xinhao.rb` are rewritten by the
  fork's release workflow; do not edit them by hand.
