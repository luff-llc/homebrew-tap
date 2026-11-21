class Devdisk < Formula
  desc "Explain and reclaim disk space used by local development"
  homepage "https://github.com/luff-llc/devdisk"
  url "https://github.com/luff-llc/devdisk/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "211ac73b6d6ad25298ca6fce5fc2f3f9a885c925fa5a3f13098f25dd72b83edb"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "devdisk"
    bin.install ".build/release/devdisk"
  end

  def caveats
    <<~EOS
      devdisk clean is a dry run until you add --apply.
      Run devdisk guide for conventions to paste into AGENTS.md or CLAUDE.md.
      Simulator leases and the size cache are kept in ~/.local/state/devdisk.
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/devdisk help")
    assert_match "pressure", shell_output("#{bin}/devdisk status")
  end
end
