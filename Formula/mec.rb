class Mec < Formula
  desc "Command-line tool to interact with Medallia Experience Cloud services"
  homepage "https://github.com/medallia/mec-cli"
  url "https://github.com/medallia/mec-cli/releases/download/v1.0.0/mec-1.0.0.tgz"
  sha256 "SHA256_PLACEHOLDER" # TODO: Replace with actual SHA256 checksum of the tarball
  license "Apache-2.0"

  depends_on "node"

  def install
    # TODO: Update below with binary build steps when available
    # Currently, we are downloading the source tarball and building it
    # Install npm dependencies and build the project
    system "npm", "install", "--production"
    system "npm", "run", "build"

    # Install the built CLI
    libexec.install Dir["*"]
    
    # Create a wrapper script that calls the Node.js script
    (bin/"mec").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/mec.js" "$@"
    EOS
  end

  test do
    # Test that the CLI can display version information
    assert_match "1.0.0", shell_output("#{bin}/mec --version")
    
    # Test that the CLI can display help
    assert_match "Medallia Experience Cloud", shell_output("#{bin}/mec --help")
  end
end
