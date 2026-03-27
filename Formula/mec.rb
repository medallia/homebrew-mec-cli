class Mec < Formula
  version "1.2.0"
  revision 2 # Increment this when making a new build or packaging change before next version upgrade

  desc "A reference implementation for interacting with Medallia Experience Cloud (MEC) services via the command line"
  homepage "https://github.com/medallia/mec-cli"
  license "Apache-2.0"

  # Multi-platform standalone binaries (no Node.js required)
  on_macos do
    # Use x64 for better compatibility - Apple Silicon runs x64 via Rosetta
    url "https://github.com/medallia/mec-cli/releases/download/v#{version}/mec-macos-x64.tgz"
    sha256 "a9b98ee3de2a5402d6cd212f93850d123e6cd629b089035ea88b039b344352c1"
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medallia/mec-cli/releases/download/v#{version}/mec-linux-arm64.tgz"
      sha256 "686b413412b7dbd5766daca8c9fadc6253824d01eec05bff6fdc8122f6f2024b"
    else
      url "https://github.com/medallia/mec-cli/releases/download/v#{version}/mec-linux-x64.tgz"
      sha256 "c6a8c323447bd84e9f0f25bacb24b63b24f668d3365a11860fd2a83f171e0b6a"
    end
  end

  # No dependencies - standalone binary
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
    assert_match version.to_s, shell_output("#{bin}/mec --version")
    
    # Test that the CLI can display help
    assert_match "Medallia Experience Cloud", shell_output("#{bin}/mec --help")
  end
end
