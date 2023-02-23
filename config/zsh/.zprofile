# Set PATH, MANPATH, etc., for Homebrew.
eval "$(brew shellenv)"

# For protoc-gen-dart
export PATH="$PATH:$HOME/.pub-cache/bin"

# Gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# For protoc-gen-go
export PATH="$(go env GOPATH)/bin:$PATH"
