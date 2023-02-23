# ----------------------------------------------------------
#                      .__
#       ________  _____|  |_________   ____
#       \___   / /  ___/  |  \_  __ \_/ ___\
#        /    /  \___ \|   Y  \  | \/\  \___
#       /_____ \/____  >___|  /__|    \___  >
#             \/     \/     \/            \/   @masssun
# ----------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( 
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

import_rc() {
  import_zsh_config "$ZSH_CONFIG_HOME/rc/$1"
}

import_rc 'alias.rc.zsh'
