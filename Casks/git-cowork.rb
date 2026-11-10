cask "git-cowork" do
  version "0.5.3"
  sha256 "7b87eb569b1ffb36cc8c6dcb75a898ae17f31b06748295e3c2c3420890df1af1"

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
  # Homebrew flags every cask download for Gatekeeper, and this free, open
  # source app has no paid Apple signature. Clear the flag so it opens normally.
  installer script: {
    executable: "/usr/bin/xattr",
    args:       ["-dr", "com.apple.quarantine", "#{staged_path}/git-cowork.app"],
  }
  binary "#{appdir}/git-cowork.app/Contents/Helpers/git-cowork"

  zap trash: "~/Library/Preferences/ai.smao.git-cowork.plist"
end
