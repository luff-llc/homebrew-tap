class Devdisk < Formula
  desc "Explain and reclaim disk space used by local development"
  homepage "https://github.com/luff-llc/devdisk"
  url "https://github.com/luff-llc/devdisk/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "739f0681c8ae0cc9b03c8786a43dbf22a39893c1b3b96a149bb70ac3706727f4"
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
