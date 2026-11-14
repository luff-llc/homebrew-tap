class KvmDisplaySync < Formula
  desc "Keep the Mac desktop layout in sync with a monitor's KVM switch"
  homepage "https://github.com/luff-llc/kvm-display-sync"
  url "https://github.com/luff-llc/kvm-display-sync/releases/download/v0.1.0/KVM-Display-Sync-0.1.0-source.zip"
  sha256 "d073574540e6f50d7ed3c477d778374bca99fa0b4567dd3b51d6b1c8f9aea5f6"
  license "MIT"

  depends_on xcode: ["26.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "kvm-display-sync"
    bin.install ".build/release/kvm-display-sync"
  end

  def caveats
    <<~EOS
      Run kvm-display-sync setup once from the Mac's built-in screen.
      The app and CLI share one background service. Setup copies the tool to
      ~/.local/bin and installs a login agent; brew services is not required.
      Run kvm-display-sync uninstall before removing this formula to stop
      the installed service and remove its copied helper.
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/kvm-display-sync help")
  end
end
