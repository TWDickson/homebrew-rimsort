cask "rimsort" do
  version "1.16.0"

  on_arm do
    sha256 "941b498c7170e59c61e43a4f38bf6ff6adc360e0df6da91cbaa99b54eed3f130"

    url "https://github.com/RimSort/RimSort/releases/download/v#{version}/RimSort-v#{version}-Darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "eb5dfed0a0fb1ebea295e682e37a2a66db4589f488c68e0844cb8d4ab5aa0e0f"

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
