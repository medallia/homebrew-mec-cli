class Mec < Formula
  desc "A reference implementation for interacting with Medallia Experience Cloud (MEC) services via the command line"
  homepage "https://github.com/medallia/mec-cli"
  license "Apache-2.0"

  # Multi-platform standalone binaries (no Node.js required)
  on_macos do
    # Use x64 for better compatibility - Apple Silicon runs x64 via Rosetta
    url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-macos-x64.tgz"
    sha256 "a8ad0e26ff6ed9d182afbeba7d6bed83fa0c4732b56f886723e2985796e65dd2"
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-linux-arm64.tgz"
      sha256 "a54618980666852df558893e45b27154644891c315aa6498ebf8b3638e5251b1"
    else
      url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-linux-x64.tgz"
      sha256 "26136d71a19a07d6cc8c6d44e48117fbb9ee7f0444dc2f2c9b5de825d7399f57"
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
    assert_match "1.0.0", shell_output("#{bin}/mec --version")
    
    # Test that the CLI can display help
    assert_match "Medallia Experience Cloud", shell_output("#{bin}/mec --help")
  end
end
