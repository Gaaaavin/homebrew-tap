cask "openchamber-xinhao" do
  # version = "<upstream>,<yyyymmddHHMM>,<short sha>"; rewritten by fork-sync.yml
  # in Gaaaavin/openchamber on every release. Do not edit by hand.
  version "1.22.2,202609062252,84d634e"
  sha256 "7b5b395b9ff5835a174fb2a297e9cb52833025a5be89bac52e6028b9ccfe0821"

  url "https://github.com/Gaaaavin/openchamber/releases/download/v#{version.csv.first}-xinhao.#{version.csv.second}-#{version.csv.third}/OpenChamber-#{version.csv.first}-mac-arm64.zip"
  name "OpenChamber (xinhao fork)"
  desc "Desktop and web interface for OpenCode AI agent, personal fork"
  homepage "https://github.com/Gaaaavin/openchamber"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)-xinhao\.(\d+)-(\h+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]},#{match[3]}"
    end
  end

  conflicts_with cask: "openchamber"
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "OpenChamber.app"

  # The build is ad-hoc signed, so a quarantined copy fails Gatekeeper ("app is
  # damaged") on first launch, and every release has a new code identity, so
  # Homebrew's approval inheritance on upgrade never matches either. Dropping
  # the quarantine attribute is what `--no-quarantine` did before Homebrew 6
  # removed the flag. Tolerate a non-zero exit: at worst one file keeps the
  # attribute and macOS asks once.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/OpenChamber.app"],
        must_succeed: false
  end

  uninstall quit: "dev.openchamber.desktop"

  zap trash: [
    "~/.config/openchamber",
    "~/Library/Application Support/ai.opencode.openchamber",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/dev.openchamber.desktop.sfl*",
    "~/Library/Application Support/OpenChamber",
    "~/Library/Caches/ai.opencode.openchamber",
    "~/Library/Logs/OpenChamber",
    "~/Library/Preferences/ai.opencode.openchamber.plist",
    "~/Library/Preferences/dev.openchamber.desktop.plist",
    "~/Library/Saved Application State/ai.opencode.openchamber.savedState",
    "~/Library/WebKit/ai.opencode.openchamber",
  ]

  caveats <<~EOS
    This build is ad-hoc signed and not notarized (no Apple Developer ID). The
    cask removes the quarantine attribute after install so macOS opens it
    without a Gatekeeper prompt. Only install it if you trust the fork's CI.
  EOS
end
