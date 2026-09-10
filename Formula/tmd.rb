class Tmd < Formula
  desc "Modern parser, CLI, and multi-format music rendering toolkit for TMD"
  homepage "https://github.com/zonble/TmdSwift"
  url "https://github.com/zonble/TmdSwift/archive/refs/tags/0.1.5.tar.gz"
  sha256 "9c9d8fc6322661b796842b3d11ccd3a5ef56bfdfa3fe378fda028a1fa94715aa"
  license "MIT"
  head "https://github.com/zonble/TmdSwift.git", branch: "main"

  on_macos do
    depends_on xcode: ["16.0", :build]
  end

  on_linux do
    depends_on "swift" => :build
  end

  def install
    system "swift", "build",
      "--configuration", "release",
      "--disable-sandbox",
      "--product", "tmd"

    bin.install ".build/release/tmd"
  end

  test do
    assert_match "TMD (Timebase Mark Down)", shell_output("#{bin}/tmd --help")
  end
end
