cask "luff-kvm-display-sync" do
  version "0.1.1"
  sha256 "1e4a51f9627291fb673557fd94c77a6e8a4074a78ed964819c2d5d93de31b517"

  url "https://github.com/luff-llc/kvm-display-sync/releases/download/v#{version}/KVM-Display-Sync-#{version}-macOS-arm64.zip"
  name "KVM Display Sync by LUFF"
  desc "Keep the desktop layout in sync with a monitor's KVM switch"
  homepage "https://github.com/luff-llc/kvm-display-sync"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "KVM Display Sync.app"

  uninstall quit: "com.luff.kvm-display-sync"

  caveats <<~EOS
    Open KVM Display Sync and complete its monitor/USB setup once.
    The background service continues after the app quits.
    Before uninstalling, use Uninstall Service in the app or run
    ~/.local/bin/kvm-display-sync uninstall.
  EOS
end
