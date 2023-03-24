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
alias fprun="flutter pub run"
alias fbuild="flutter pub run build_runner build --delete-conflicting-outputs"
alias fcreate=flutter_create
alias mls="flutter pub run melos"

function flutter_create() {
    flutter create $1 --org=$2 --platforms=android,ios && mv $1/* $1/.[^\.]* ./ && rm -rf $1
}

# Docker
alias d="docker"
alias ds="docker search"
alias di="docker images"
alias dipl="docker image pull"
alias drmi="docker rmi"
alias drmip="docker image prune" # 未使用イメージを全て削除
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dr="docker run"
alias dri=docker_run_interactively
alias drb=docker_run_background
alias drs=docker_run_server
alias dst="docker start"
alias dsp="docker stop"
alias drst="docker restart"
alias drm="docker rm"
alias drmca="docker container prune" # 未使用コンテナを全て削除
alias drnm="docker rename"
alias datch="docker attach"
alias dex="docker exec"
alias dexi=docker_exec_interactively
alias dl="docker logs"
alias dlf="docker logs -f"
alias db="docker build"
alias dba="docker build ."
alias dbt=docker_build_with_tag
alias dbft=docker_build_file_with_tag
alias dc="docker compose"
alias dcbn="docker compose build --no-cache"
alias dcu="docker compose up"
alias dcub="docker compose up --build"
alias dcubd="docker compose up --build -d"
alias dcr="docker compose restart"

function docker_build_with_tag() {
    docker build . -t $1
}
function docker_build_file_with_tag() {
    docker build . -f $1 -t $2
}
function docker_run_interactively() {
    docker run -it $1 /bin/bash
}
function docker_run_background() {
    docker run -it -d $1 /bin/bash
}
function docker_run_server() {
    docker run -it -p $2 $1 /bin/bash
}
function docker_exec_interactively() {
    docker exec -it $1 /bin/bash
}

# protoc
alias pcgo=protoc_gen_go
alias pcdt=protoc_gen_dart

function protoc_gen_go() {
    protoc -I $1 --go_out=paths=source_relative:$2 --go-grpc_out=paths=source_relative:$2 $1/*.proto
}
function protoc_gen_dart() {
    protoc -I $1 --dart_out=$2 $1/*.proto
}

# Shell
alias relogin="exec $SHELL -l"

alias rr="rm -r"
alias rrf="rm -rf"

# iOS
alias lapp="la ~/Library/MobileDevice/Provisioning\ Profiles"
alias rpp=remove_provisioning_profile
alias rppa="rm -f ~/Library/MobileDevice/Provisioning\ Profiles/*"

function remove_provisioning_profile() {
    rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$1
}

# grpcurl
alias gcl=grpcurl_daifuku
alias gcll=grpcurl_daifuku_list

function grpcurl_daifuku() {
    grpcurl -plaintext -rpc-header 'authorization: Bearer mock-user-id-1' localhost:9090 $1
}
function grpcurl_daifuku_list() {
     grpcurl -plaintext localhost:9090 list $1
}

# Go
alias goi="echo $(git diff --name-only) | xargs gosimports -w"
