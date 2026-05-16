cask "chessray" do
  version "0.2.86"
  sha256 "4436691ba12b2c38574c5d2892342a21cebf3cd8a18eab5a0327ef747aab9370"

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
