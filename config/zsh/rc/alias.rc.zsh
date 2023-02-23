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

# Docker
alias d="docker"
alias ds="docker search"
alias dim="docker images"
alias dimp="docker image pull"
alias drmi="docker rmi"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dr="docker run"
alias drd="docker run -d" # コンテナのメインプロセスを端末からデタッチする
alias drit="docker run -it" # コンテナの標準入力を開く / 端末を割り当てる
alias dst="docker start"
alias dsp="docker stop"
alias drst="docker restart"
alias drm="docker rm"
alias drnm="docker rename"
alias datch="docker attach"
alias dexe="docker exec"
alias dexeit="docker exec -it" # コンテナの標準入力を開く / 端末を割り当てる

# protoc
function pcgo() {
    protoc -I $1 --go_out=paths=source_relative:$2 --go-grpc_out=paths=source_relative:$2 $1/*.proto
}
function pcdt() {
    protoc -I $1 --dart_out=$2 $1/*.proto
}
alias pcgo=pcgo
alias pcdt=pcdt

# Shell
alias relogin="exec $SHELL -l"

alias rr="rm -r"
alias rrf="rm -rf"
