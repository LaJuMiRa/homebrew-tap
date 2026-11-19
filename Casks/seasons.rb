# Homebrew Cask template for Seasons.
# Copy to Casks/seasons.rb in the tap repository (LaJuMiRa/homebrew-tap) and replace:
#   1.0.0   e.g. 1.0.0
#   0dff0a1e49c8f457eabc98a5ecd0ed80e8dc8ddd33737ef6834204d4960f15d0    from Seasons-<version>-arm64.zip.sha256 on the GitHub release page
cask "seasons" do
  version "1.0.0"
  sha256 "0dff0a1e49c8f457eabc98a5ecd0ed80e8dc8ddd33737ef6834204d4960f15d0"

  url "https://github.com/LaJuMiRa/Seasons/releases/download/v#{version}/Seasons-#{version}-arm64.zip"
  name "Seasons"
  desc "Seasonal snow, leaves, rain, blossoms and flowers on your desktop"
  homepage "https://github.com/LaJuMiRa/Seasons"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Seasons.app"

  uninstall quit: "com.laurenzrauscher.Seasons"

  zap trash: [
    "~/Library/Preferences/com.laurenzrauscher.Seasons.plist",
    "~/Library/Saved Application State/com.laurenzrauscher.Seasons.savedState",
  ]

  caveats <<~EOS
    Seasons is ad-hoc signed but not notarized by Apple (no paid developer account).
    macOS will block the first start. Either allow it in
      System Settings > Privacy & Security > "Open Anyway"
    or remove the quarantine flag once:
      xattr -dr com.apple.quarantine "#{appdir}/Seasons.app"
  EOS
end
