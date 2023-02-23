#!/bin/bash

DOTFILES_HOME=$(pwd)
CONFIG_HOME="config"

configs=(zsh)

for config in "${configs[@]}"; do
    cd $DOTFILES_HOME/$CONFIG_HOME/$config
    for file in `ls -A | xargs readlink -f`; do
        echo "Create symbolic link..."
        ln -svf $file $HOME
    done
done