cask "rimsort" do
  version "1.17.0"

  on_arm do
    sha256 "5d26dd274437d70b103799a7ed43582321e5593db031d36ad7738833705830de"

    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "b3d0dd46551c86296518bf06871f7676d70eb75eeeec52519991e167354140e6"

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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/RimSort.app"]
  end

  zap trash: [
    "~/.config/RimSort",
    "~/Library/Application Support/RimSort",
  ]
end
