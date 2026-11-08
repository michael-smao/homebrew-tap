cask "git-cowork" do
  version "0.2.0"
  sha256 "3e494e0f31d5edb04ebec8515f30f7e7f609cd66417e881dca5c90d4c6f1f875"

  url "https://github.com/michael-smao/git-cowork/releases/download/v#{version}/git-cowork-#{version}-macos-arm64.zip"
  name "git-cowork"
  desc "Small, fast git client with a task board and code reviews in your repo"
  homepage "https://github.com/michael-smao/git-cowork"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "git-cowork.app"
  binary "#{appdir}/git-cowork.app/Contents/Helpers/git-cowork"

  # Homebrew flags every cask download for Gatekeeper, and this free, open
  # source app has no paid Apple signature. Clear the flag so it opens normally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/git-cowork.app"]
  end

  zap trash: "~/Library/Preferences/ai.smao.git-cowork.plist"
end
