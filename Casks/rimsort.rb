cask "rimsort" do
  version "1.17.3"

  on_arm do
    sha256 "115555d03c9959b5043e1fe5284c81f4d0fcb5f263dc8030965700ce75a43569"

    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "90e703a04aff21198c03c949b8ab510dd1b251edf909b329670729924f47439f"

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
