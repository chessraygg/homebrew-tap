cask "chessray" do
  version "0.2.94"
  sha256 "63054e6faa40c1a9493b09408a993f8cd4b68af2b059f10aed3872306f95b360"

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
