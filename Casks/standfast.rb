cask "standfast" do
  version "0.6.0"
  sha256 "d1c3a0b9f53de9f87bc2c314770f60b42b42c284520e16a8fac6929dd69eecd0"

  url "https://github.com/Perafan18/standfast/releases/download/v#{version}/Standfast.zip"
  name "Standfast"
  desc "Menu bar app for self-hosted GitHub Actions runners"
  homepage "https://perafan18.github.io/standfast/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Matches LSMinimumSystemVersion in the app's Info.plist.
  depends_on macos: :sonoma

  app "Standfast.app"

  # The GitHub and GitLab tokens live in the login Keychain, which `zap` does
  # not touch; remove them from Keychain Access if you want them gone too.
  zap trash: [
    "~/Library/Caches/dev.standfast.app",
    "~/Library/HTTPStorages/dev.standfast.app",
    "~/Library/Preferences/dev.standfast.app.plist",
  ]

  caveats <<~EOS
    To read whether GitHub can see each runner, paste a GitHub token in
    Settings; Standfast keeps it in your login Keychain. With no token stored
    it borrows the credentials of the GitHub CLI instead:
      brew install gh && gh auth login
  EOS
end
