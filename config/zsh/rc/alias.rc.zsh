# Git
alias g="git"
alias gbda="git branch | xargs git branch -D"
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# ghq
alias ghg='ghq get'
alias ghgp='ghq get -p'
alias gcd='cd $(ghq root)/$(ghq list | peco)'

# Flutter
alias flutter="fvm flutter"
alias ftest="flutter test -r expanded"
alias fbuild="flutter pub run build_runner build --delete-conflicting-outputs"

# Shell
alias relogin="exec $SHELL -l"

alias rr="rm -r"
alias rrf="rm -rf"
