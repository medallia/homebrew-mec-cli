class MecLocal < Formula
  desc "Command-line tool to interact with Medallia Experience Cloud services (Local Testing)"
  homepage "https://github.com/medallia/mec-cli"
  license "Apache-2.0"
  
  # LOCAL TESTING ONLY - Using local file
  url "file:///path/to/homebrew-mec-cli/mec-1.0.0.tgz" # Update path as needed
  sha256 "7f2dc0a8036f335013a11c7c01837b7cdce42599cd3e67d5c161882768d815fb" # Update SHA256 (shasum -a 256 mec-1.0.0.tgz) of the tarball

  # No dependencies - standalone binary
  
  # Override build system detection to prevent npm install
  def self.detected_build_systems
    []
  end

  def install
    # Install the standalone binary directly from tarball
    bin.install "mec"
  end

  test do
    # Test that the CLI can display version information
    assert_match "1.0.0", shell_output("#{bin}/mec --version")
    
    # Test that the CLI can display help
    assert_match "Medallia Experience Cloud", shell_output("#{bin}/mec --help")
  end
end
