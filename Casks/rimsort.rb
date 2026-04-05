cask "rimsort" do
  version "1.0.76"

  on_arm do
    sha256 "f07d05d7c681472ff877cea80fa31889ad7a498175930395d9826fc3bb7741fd"
    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm.zip"
  end

  on_intel do
    sha256 "8d17d96590a94fcd935b8fbfff59b722e40b03aff34f3cf5bede53807e7bdda4"
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
                   sudo: false
  end

  zap trash: [
    "~/.config/RimSort",
    "~/Library/Application Support/RimSort",
  ]
end
