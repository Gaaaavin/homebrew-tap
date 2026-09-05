cask "openchamber-xinhao" do
  # version = "<upstream>,<yyyymmddHHMM>,<short sha>"; rewritten by fork-sync.yml
  # in Gaaaavin/openchamber on every release. Do not edit by hand.
  version "1.22.2,000000000000,0000000"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
    This build is ad-hoc signed and not notarized. Install and upgrade with
    quarantine disabled or macOS will refuse to open it:

      export HOMEBREW_CASK_OPTS="--no-quarantine"
  EOS
end
