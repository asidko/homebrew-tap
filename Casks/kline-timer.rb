cask "kline-timer" do
  version "1.2.0"
  sha256 "c737a481071ef2ed35975e64ac25061c04a1f5e67983d321263bcf4383b14eec"

  url "https://github.com/asidko/kline-timer/releases/download/v#{version}/KlineTimer.dmg"
  name "Kline Timer"
  desc "Menu-bar countdown to the trading candle close"
  homepage "https://github.com/asidko/kline-timer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "KlineTimer.app"

  zap trash: "~/Library/Preferences/com.kline.timer.plist"

  caveats <<~EOS
    Kline Timer is ad-hoc signed, not notarized. macOS may block the first launch:
    right-click the app in Applications and choose Open, or run

      xattr -dr com.apple.quarantine "/Applications/KlineTimer.app"
  EOS
end
