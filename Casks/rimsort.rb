cask "rimsort" do
  version "1.13.2"

  on_arm do
    sha256 "c73cfef0bbd6487e845837ca220727f707ed3e814a293fd65d04fe71d1da0884"

    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "dc167a055ea602e1182dee117826079da6bb33c664c30c198917b6f2f6a60874"

    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_x86_64.tar.gz"
  end

  name "RimSort"
  desc "Open source mod manager for RimWorld"
  homepage "https://github.com/RimSort/RimSort"

  livecheck do
    url "https://github.com/RimSort/RimSort/releases/latest"
    strategy :github_latest
  end

  depends_on :macos

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
