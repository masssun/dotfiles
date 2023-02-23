# Set PATH, MANPATH, etc., for Homebrew.
eval "$(brew shellenv)"

export PATH="/usr/local/bin/git:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
