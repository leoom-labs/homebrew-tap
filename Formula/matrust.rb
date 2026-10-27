# MatRust: MATLAB-compatible numerical engine with a native desktop workspace.
# Prebuilt release archives from https://github.com/leoom-labs/matrust/releases.
class Matrust < Formula
  desc "Numerical workspace that runs a subset of the MATLAB language"
  homepage "https://matrust.dev"
  version "0.1.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/leoom-labs/matrust/releases/download/v0.1.1/MatRust-0.1.1-macos-arm64.tar.gz"
    sha256 "8018cb30aaf083eb46da074531bedaaeb1aecf75fb652eab7f93186c4c74077f"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/leoom-labs/matrust/releases/download/v0.1.1/MatRust-0.1.1-linux-x64.tar.gz"
    sha256 "a43b6986a711d2ce8fb3453bcec47ceea5190859539cec092a908766c1fdaf64"
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
