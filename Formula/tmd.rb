class Tmd < Formula
  desc "Modern parser, CLI, and multi-format music rendering toolkit for TMD"
  homepage "https://github.com/zonble/TmdSwift"
  url "https://github.com/zonble/TmdSwift/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "1e118ae60d82f14732d51c948706da46a0f928be5e0219101bc4e1b9f0368d2b"
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
