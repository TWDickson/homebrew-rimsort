cask "rimsort" do
  version "1.2.2"

  on_arm do
    sha256 "4ffb127d274ae59e7d23ed809cb1847abc0a13032b95624fef087cf6164b9f8a"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.tar.gz"
  end

  on_intel do
    sha256 "db705dcc288961c43762874070ba2f27a68be0085b54d9b2ffb2088a77669e9d"
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
