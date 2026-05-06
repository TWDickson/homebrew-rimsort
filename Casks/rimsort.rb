cask "rimsort" do
  version "1.1.0"

  on_arm do
    sha256 "071e0c325c3e5171c6be0c69b560ac4cf357e50f7ddbb167d0066e548fd88dcd"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.zip"
  end

  on_intel do
    sha256 "46929762bedf5337326bec9c4bcc4101983a3bd90553dc3a1b04872fdc674ed4"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_i386.zip"
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
