class Mec < Formula
  desc "A reference implementation for interacting with Medallia Experience Cloud (MEC) services via the command line"
  homepage "https://github.com/medallia/mec-cli"
  license "Apache-2.0"

  # Multi-platform standalone binaries (no Node.js required)
  on_macos do
    # Use x64 for better compatibility - Apple Silicon runs x64 via Rosetta
    url "https://github.com/medallia/mec-cli/releases/download/v1.1.0/mec-macos-x64.tgz"
    sha256 "3269ea7d2f0936b3637201cee0417bc8d1369cfd9a9901018e14d9f53d230f20"
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medallia/mec-cli/releases/download/v1.1.0/mec-linux-arm64.tgz"
      sha256 "8ef4baeefbed57452e693c299c5423b5fd1d48ab10fe739baef5670747ef79db"
    else
      url "https://github.com/medallia/mec-cli/releases/download/v1.1.0/mec-linux-x64.tgz"
      sha256 "ca4a26c17df626f589743098235028638132647064aa9cc28e269a6f78c2824b"
    end
  end

  # No dependencies - standalone binary
  
  # Override build system detection to prevent npm install
  def self.detected_build_systems
    []
  end

  def install
    # Homebrew automatically extracts .tgz files
    # For macOS, we always use x64; for Linux, detect the architecture
    if OS.mac?
      binary_name = "mec-macos-x64"
    elsif Hardware::CPU.arm?
      binary_name = "mec-linux-arm64"
    else
      binary_name = "mec-linux-x64"
    end

    bin.install binary_name => "mec"
  end

  test do
    # Test that the CLI can display version information
    assert_match "1.1.0", shell_output("#{bin}/mec --version")
    
    # Test that the CLI can display help
    assert_match "Medallia Experience Cloud", shell_output("#{bin}/mec --help")
  end
end
