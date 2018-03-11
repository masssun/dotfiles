 #!/bin/bash

dotfiles=(
    .zshrc
)

for file in ${dotfiles[@]}
do
    if [ -e $HOME/$file ]; then
        rm -f $HOME/$file
    fi
    ln -s $PWD/zsh/$file $HOME/$file
done