cask "browsing-wrapped" do
  version "1.0.0"
  sha256 "329cb4f243629d634757546974e2af4b25860a47656a28f6ec93a31e0819bb34"

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
