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

## Upgrading

### Check for Updates
```bash
brew update
brew outdated
```

### Upgrade to Latest Version
```bash
brew upgrade mec
```

### Force Reinstall (if upgrade doesn't work)
If `brew upgrade mec` doesn't detect a new version, you can force a reinstall:
```bash
brew reinstall mec
```

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

## License

Copyright 2025.  Medallia, Inc.
    
Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License.  You may obtain
a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

