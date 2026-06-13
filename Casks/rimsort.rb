cask "rimsort" do
  version "1.4.0"

  on_arm do
    sha256 "ce9090d95e32d6b5ca76e204e2ee5bd942f3fa2a3fe23e9e4703dbbfc739a0d9"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.tar.gz"
  end

  on_intel do
    sha256 "3f66286d6b9144a702edfebedb4486cda2d12df0bbac684d7f2d3ac4fb536c92"
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
