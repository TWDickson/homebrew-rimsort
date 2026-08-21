cask "rimsort" do
  version "1.11.1"

  on_arm do
    sha256 "b40d9ac084ef65bbeaf4c467e7b6bde2011e4d0c3b419b48df303363180b4b23"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.tar.gz"
  end

  on_intel do
    sha256 "6d4e8a08d191d6cb9d61596b61790c10ccd7f3163f769d4c7fe2015fb9169c50"
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
