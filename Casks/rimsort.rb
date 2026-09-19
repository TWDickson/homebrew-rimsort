cask "rimsort" do
  version "1.14.0"

  on_arm do
    sha256 "078fa55fcc918f43b06724fe55524c26208adf18abad4f6c52df1da6b5447a88"

    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "b8c365ad9e3dc4d2b9055d8bf49c9b66f1b98017e48eedb7442102e78d99e546"

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
