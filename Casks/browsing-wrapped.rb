cask "browsing-wrapped" do
  version "1.0.1"
  sha256 "268c2a269b766ea76a2e19781bb2525840e87598f3c46976cf1d67c3279c4a50"

  url "https://github.com/LaJuMiRa/safari-wrapped/releases/download/v#{version}/Browsing-Wrapped-#{version}.zip"
  name "Browsing Wrapped"
  desc "Local-only Safari extension for browsing recaps"
  homepage "https://github.com/LaJuMiRa/safari-wrapped"

  depends_on macos: :tahoe

  app "Browsing Wrapped.app"

  uninstall quit: "com.laurenz.browsingwrapped"

  zap trash: [
    "~/Library/Containers/com.laurenz.browsingwrapped",
    "~/Library/Containers/com.laurenz.browsingwrapped.Extension",
  ]

  caveats <<~EOS
    Browsing Wrapped is not notarized by Apple, so macOS blocks the first start.
    Either allow it in
      System Settings > Privacy & Security > "Open Anyway"
    or remove the quarantine flag once:
      xattr -dr com.apple.quarantine "#{appdir}/Browsing Wrapped.app"

    Then enable the extension:
      Safari > Settings > Extensions > "Browsing Wrapped"

    All data stays local on your device.
  EOS
end
