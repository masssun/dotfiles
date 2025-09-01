# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# For protoc-gen-dart
export PATH="$PATH:$HOME/.pub-cache/bin"

# Gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# For protoc-gen-go
export PATH="$(go env GOPATH)/bin:$PATH"

# Android SDK Platform Tools
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
