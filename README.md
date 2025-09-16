# homebrew-mec-cli

Homebrew tap for the Medallia Experience Cloud CLI.

## Requirements

- Homebrew
- Ruby (for syntax checking)

## Installation

```bash
brew tap medallia/mec-cli
brew install mec
```

## Uninstall

```bash
brew uninstall mec
brew untap medallia/mec-cli
```

## Local Testing

### Syntax Check
```bash
ruby -c Formula/mec.rb
```

### Test Locally
```bash
# Create local tap
brew tap medallia/mec-cli /path/to/homebrew-mec-cli

# Install from local tap
brew install medallia/mec-cli/mec

# Uninstall
brew uninstall mec
brew untap medallia/mec-cli
```
