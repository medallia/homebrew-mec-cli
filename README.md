# homebrew-mec-cli

Homebrew tap for the Medallia Experience Cloud CLI.

## Requirements

- Homebrew
- Ruby (for syntax checking)

## Installation

### Production Installation
```bash
brew tap medallia/mec-cli
brew install mec
```

### Local Development/Testing
```bash
brew tap medallia/mec-cli /path/to/local/homebrew-mec-cli
brew install mec-local
```

## Formulas

- **`mec`** - Production formula that downloads binaries from GitHub releases
- **`mec-local`** - Local testing formula that uses local tarball for development

## Uninstall

```bash
# Production version
brew uninstall mec

# Local testing version
brew uninstall mec-local

# Remove tap completely
brew untap medallia/mec-cli
```

## Development

### Syntax Check
```bash
ruby -c Formula/mec.rb
ruby -c Formula/mec-local.rb
```

### Testing Formula Changes
```bash
# Refresh local tap after making changes
brew untap medallia/mec-cli
brew tap medallia/mec-cli /path/to/local/homebrew-mec-cli

# Test the local formula
brew install mec-local
```
