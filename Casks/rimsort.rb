cask "rimsort" do
  version "1.17.4"
  sha256 "a4295f2f81320cf7b012442f69ff2a84e1225863d92283b1ec3ac5df21a92c74"

  url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm64.tar.gz"
  name "RimSort"
  desc "Open source mod manager for RimWorld"
  homepage "https://github.com/RimSort/RimSort"

  livecheck do
    url "https://github.com/RimSort/RimSort/releases/latest"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "RimSort.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/RimSort.app"]
  end

  zap trash: [
    "~/.config/RimSort",
    "~/Library/Application Support/RimSort",
  ]
end
