#!/bin/bash

DOTFILES_HOME=$(pwd)
CONFIG_HOME="config"
VS_CODE="vscode"

configs=(
    git
    $VS_CODE
    zsh
)

create_symbolic_links () {
    for file in `ls -A | xargs readlink -f`; do
        echo "Create symbolic link..."
        ln -svf $file "$1"
    done
}

for config in "${configs[@]}"; do
    cd $DOTFILES_HOME/$CONFIG_HOME/$config
    if [ $config = $VS_CODE ]; then
        create_symbolic_links $HOME/Library/Application\ Support/Code/User
        continue
    fi
    create_symbolic_links $HOME
done
