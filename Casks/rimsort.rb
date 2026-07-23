cask "rimsort" do
  version "1.10.1"

  on_arm do
    sha256 "317865bfe6950b37899d44585e539f348109e1f458c66a5c9fe41e9ee0d14b9c"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.tar.gz"
  end

  on_intel do
    sha256 "0d22725fe2cc4ae535e23d67429b8a1097070581a60f74b9dd51cb1979249a9d"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_i386.tar.gz"
  end

  name "RimSort"
  desc "Open source mod manager for RimWorld"
  homepage "https://github.com/RimSort/RimSort"

  livecheck do
    url "https://github.com/RimSort/RimSort/releases/latest"
    strategy :github_latest
  end

  app "RimSort.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/RimSort.app"],
                   sudo: true
  end

  zap trash: [
    "~/.config/RimSort",
    "~/Library/Application Support/RimSort",
  ]
end
