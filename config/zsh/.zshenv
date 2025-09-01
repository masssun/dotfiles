export ZSH_CONFIG_HOME=$HOME/.config/zsh

import_zsh_config() {
  local source_file="$1"

  if [ -f "$source_file" ]; then
    source "$source_file"
  else
    echo "$source_file not found" >&2
    exit 1
  fi
}
