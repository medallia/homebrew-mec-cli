class Mec < Formula
  desc "Command-line tool to interact with Medallia Experience Cloud services"
  homepage "https://github.com/medallia/mec-cli"
  license "Apache-2.0"
  
  # Multi-platform standalone binaries (no Node.js required)
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-macos-arm64"
      sha256 "MACOS_ARM64_SHA256_PLACEHOLDER"
    else
      url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-macos-x64"
      sha256 "MACOS_X64_SHA256_PLACEHOLDER"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-linux-arm64"
      sha256 "LINUX_ARM64_SHA256_PLACEHOLDER"
    else
      url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-linux-x64"
      sha256 "LINUX_X64_SHA256_PLACEHOLDER"
    end
  end

  # No dependencies - standalone binary
  
  # Override build system detection to prevent npm install
  def self.detected_build_systems
    []
  end

  def install
    # Install the standalone binary directly
    bin.install downloaded_file.basename => "mec"
  end

  test do
    # Test that the CLI can display version information
    assert_match "1.0.0", shell_output("#{bin}/mec --version")
    
    # Test that the CLI can display help
    assert_match "Medallia Experience Cloud", shell_output("#{bin}/mec --help")
  end
end
