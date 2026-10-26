# MatRust: MATLAB-compatible numerical engine with a native desktop workspace.
# Prebuilt release archives from https://github.com/leoom-labs/matrust/releases.
class Matrust < Formula
  desc "MATLAB-compatible numerical engine and desktop workspace"
  homepage "https://matrust.dev"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/leoom-labs/matrust/releases/download/v0.1.0/MatRust-0.1.0-macos-arm64.tar.gz"
    sha256 "1e9e25c1a420eb5f2b48e5ba6a6f3f343b29f41e97f36504efab61415e855160"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/leoom-labs/matrust/releases/download/v0.1.0/MatRust-0.1.0-linux-x64.tar.gz"
    sha256 "4d3ed26fd71ba0dd8119154237e1367d64378ede7aa4674370cf353f5f11e011"
  end

  def install
    # The three programs find each other side by side.
    bin.install "matrust", "matrust-desktop", "matrust-pdf-worker"
    pkgshare.install "bench", "QUICKSTART.txt"
    doc.install "THIRD-PARTY-LICENSES.txt", "notices"
  end

  test do
    assert_match "MatRust #{version}", shell_output("#{bin}/matrust --help")
    assert_match(/ans =\s+6/, shell_output("#{bin}/matrust --eval 'sum([1 2 3])'"))
  end
end
