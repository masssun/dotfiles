# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python
export PATH=$PATH:$HOME/Library/Python/3.9/bin

# Gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# For protoc-gen-dart
export PATH="$PATH:$HOME/.pub-cache/bin"

# For protoc-gen-go
export PATH="$(go env GOPATH)/bin:$PATH"

# Android SDK
export PATH="$PATH:$HOME/Library/Android/sdk"
