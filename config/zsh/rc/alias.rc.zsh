# Git
alias g="git"
alias gcd='cd $(ghq root)/$(ghq list | peco)'
alias gbda="git branch | xargs git branch -D"
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# Flutter
alias flutter="fvm flutter"
alias ftest="flutter test -r expanded"
alias fbuild="flutter pub run build_runner build --delete-conflicting-outputs"

# Shell
alias relogin="exec $SHELL -l"
