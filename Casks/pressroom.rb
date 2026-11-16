cask "pressroom" do
  version "0.1.0"
  sha256 "cdc012419ecbfc3962e897b146e69e5b6133e45eefde784e607974ff102450b4"

  url "https://github.com/luff-llc/pressroom/releases/download/v#{version}/Pressroom-#{version}-macOS-arm64.zip"
  name "Pressroom"
  desc "Gatekeeper for the work agents run on a machine, with a menu bar item"
  homepage "https://github.com/luff-llc/pressroom"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Pressroom.app"
  binary "#{appdir}/Pressroom.app/Contents/MacOS/pressroom"

  uninstall launchctl: "works.luff.pressroom.daemon",
            quit:      "works.luff.pressroom.menubar"

  zap trash: "~/Library/Preferences/works.luff.pressroom.menubar.plist"

  caveats <<~EOS
    Open Pressroom once. It starts the daemon at login, unless a Pressroom daemon is
    already running on this Mac, and shows what runs, what waits and why.
    Start heavy work through it:
      pressroom run --threads 4 --memory-gb 4 -- cargo test
    Machine settings and leases live in ~/.pressroom; uninstalling leaves them.
  EOS
end
