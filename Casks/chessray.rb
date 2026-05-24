cask "chessray" do
  version "0.2.93"
  sha256 "72353a0911feac43c5228cc25c511d71a027bc35335d2745d1e19b865960f43f"

  url "https://github.com/chessraygg/chessray/releases/download/v#{version}/ChessRay-darwin-arm64-#{version}.zip"
  name "ChessRay"
  desc "Real-time chess position recognition and evaluation from any screen"
  homepage "https://github.com/chessraygg/chessray"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "ChessRay.app"

  postflight do
    # Remove quarantine attribute so the app launches without Gatekeeper warnings
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ChessRay.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ChessRay",
    "~/Library/Preferences/com.chessraygg.chessray.plist",
    "~/Library/Caches/com.chessraygg.chessray",
  ]
end
