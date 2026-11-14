# LUFF Homebrew tap

A shared package catalog for Mac software maintained by LUFF LLC.

## KVM Display Sync

Native Mac app (Apple Silicon, macOS 14+):

```sh
brew install --cask luff-llc/tap/luff-kvm-display-sync
```

CLI only, built from source (macOS 14+, Xcode 26+):

```sh
brew install luff-llc/tap/kvm-display-sync
kvm-display-sync setup
```

The app and CLI share one background service. You do not need both. Before removing either package, uninstall the service from the app or run `kvm-display-sync uninstall`.

Source, releases, compatibility notes and original attribution: [luff-llc/kvm-display-sync](https://github.com/luff-llc/kvm-display-sync). Based on AtakanMavzer's MIT-licensed engine, with its original history preserved.

This tap is maintained by LUFF, independently of Homebrew's main repositories. Homebrew installation may request trust for this tap or package, depending on your Homebrew version.

## Maintenance

Each app keeps its code and releases in its own repository; this tap stores only formulae and casks. For a release, update the immutable versioned asset URL and its SHA-256, run `brew style`, `brew audit --strict`, and a relevant install/test. Casks must retain Apple's signature and notarization checks; do not disable Gatekeeper.
