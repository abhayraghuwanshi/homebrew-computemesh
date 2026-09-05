cask "computemesh" do
  version "0.1.2"
  sha256 "48218d03e5afc0bba978cda60b159bfd08f58a1220633a7eeea2767115348774"

  url "https://pub-3781a376782940c5b1a2c0c31497e962.r2.dev/ComputeMesh-Worker-aarch64.dmg"
  name "ComputeMesh Worker"
  desc "Share idle compute for ComputeMesh video-transcoding jobs"
  homepage "https://computemesh.pages.dev/"

  # Only an Apple Silicon (aarch64) build is published today.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "ComputeMesh Worker.app"

  # The build is unsigned and unnotarized (no Apple Developer account) —
  # clear the quarantine flag on install so Gatekeeper doesn't block first
  # launch with an "app is damaged, move to Trash" dialog. This is the
  # actual point of distributing via a cask instead of a plain downloaded
  # DMG: Homebrew moves the .app into place itself rather than a
  # browser-quarantined drag-and-drop, and this postflight step covers the
  # rest. Remove once the app is signed + notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ComputeMesh Worker.app"],
                   sudo: false
  end

  uninstall quit: "dev.computemesh.worker"

  zap trash: [
    "~/Library/Application Support/dev.computemesh.worker",
    "~/Library/Caches/dev.computemesh.worker",
    "~/Library/HTTPStorages/dev.computemesh.worker",
    "~/Library/Preferences/dev.computemesh.worker.plist",
    "~/Library/Saved Application State/dev.computemesh.worker.savedState",
    "~/Library/WebKit/dev.computemesh.worker",
    "~/.computemesh",
  ]
end
