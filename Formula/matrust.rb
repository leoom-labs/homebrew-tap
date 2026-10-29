# MatRust: MATLAB-compatible numerical engine with a native desktop workspace.
# Prebuilt release archives from https://github.com/leoom-labs/matrust/releases.
class Matrust < Formula
  desc "Numerical workspace that runs a subset of the MATLAB language"
  homepage "https://matrust.dev"
  version "0.1.2"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/leoom-labs/matrust/releases/download/v0.1.2/MatRust-0.1.2-macos-arm64.tar.gz"
    sha256 "3867970dedc616736b04a3cda0e96db75096503c8faad6e10017052b61d11fdf"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/leoom-labs/matrust/releases/download/v0.1.2/MatRust-0.1.2-linux-x64.tar.gz"
    sha256 "c6a5b4ca381ebe44e00bbfe8982f992065902472defa3488e596c8b40c74f9b0"
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
