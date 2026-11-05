cask "daedalus" do
  version "3.4.0"
  sha256 "3b66ce62836db47f976b91ee919717c97131ed1b26586e1f8f784c725568ec76"

  url "https://github.com/tlsc-eng/daedalus/releases/download/v#{version}/Daedalus-#{version}-arm64.zip"
  name "Daedalus"
  desc "Personal IDE with persistent terminals and Claude Code integration"
  homepage "https://github.com/tlsc-eng/daedalus"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Daedalus.app"
  binary "#{appdir}/Daedalus.app/Contents/MacOS/daedalus"

  # Ad-hoc signed, with no Developer ID: Gatekeeper refuses a quarantined copy outright.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Daedalus.app"],
        writable_paths: ["Daedalus.app"],
        writable_base:  :appdir
  end

  uninstall quit: "io.tlsc.daedalus"

  # Not in uninstall: upgrades run that stanza, and must leave running shells alone.
  # By zap time the app is back in the staged path, so the relative executable resolves.
  zap script: {
        executable:   "Daedalus.app/Contents/MacOS/daedalus",
        args:         ["mux", "stop"],
        must_succeed: false,
      },
      trash:  ["~/Library/Application Support/daedalus", "~/Library/Application Support/athena"]
end
