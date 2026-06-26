cask "rimsort" do
  version "1.7.0"

  on_arm do
    sha256 "3adc958ce6e98159a99f8582b1771c757d46b1eb759a7057faba01a06630ab82"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.tar.gz"
  end

  on_intel do
    sha256 "a8c853bd5e4f6f3c5e37a9ea6ee0f16f87b067db7d44b15a3e19ed5a8cf0debf"
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
