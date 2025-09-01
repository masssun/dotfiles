# Shell
alias reload="exec $SHELL -l"
alias src="source ~/.zshrc"
alias rmr="rm -r"
alias rmrf="rm -rf"

# Git
alias g="git"
alias gb='git checkout $(git branch --format="%(refname:short)" | fzf)'
alias gbd="git branch --format='%(refname:short)' | fzf | xargs git branch -D"
alias gbda="git branch | xargs git branch -D"
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias gco="git status -s | fzf -m | awk '{print \$2}' | xargs git checkout"
alias gad="git status -s | fzf -m | awk '{print \$2}' | xargs git add"
alias gdf="git status -s | fzf -m | awk '{print \$2}' | xargs git diff"

# Homebrew
alias br="brew"
alias brl="brew leaves"
alias bri="brew install"
alias bru='f(){ brew uninstall "$1" && brew autoremove && brew cleanup; }; f'

# ghq
alias ghg='ghq get'
alias ghgp='ghq get -p'
alias gcd='cd $(ghq root)/$(ghq list | peco)'

# Flutter
alias flutter="fvm flutter"
alias dart="fvm dart"
alias melos="fvm dart run melos"

alias ftest="flutter test -r expanded"
alias fprun="flutter pub run"
alias fbuild="flutter pub run build_runner build --delete-conflicting-outputs"
alias fcreate=flutter_create

function flutter_create() {
    flutter create $1 --org=$2 --platforms=android,ios && mv $1/* $1/.[^\.]* ./ && rm -rf $1
}

# Cursor
alias cr="cursor"
alias crc="cursor ."
alias crdf="{ git diff --name-only | sed 's:^native/::'; git diff --cached --name-only; git ls-files --others --exclude-standard; } | sort | uniq | xargs -r cursor"

# Claude
alias cl="claude"
alias clc="claude -c"
alias clr="claude -r"
alias cld="claude --dangerously-skip-permissions"
alias clcd="claude -c --dangerously-skip-permissions"
alias clrd="claude -r --dangerously-skip-permissions"

function clmcpgh() {
    local github_pat=$1
    if [ -z "$github_pat" ]; then
        echo "Usage: clmcpgh <github_pat>"
        return 1
    fi
    claude mcp add --transport http github-server https://api.githubcopilot.com/mcp -H "Authorization: Bearer $github_pat"
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

# iOS
alias la_provisioning_profile=list_provisioning_profile
alias rm_provisioning_profile=remove_provisioning_profile
alias rm_provisioning_profile_all=remove_all_provisioning_profiles

function list_provisioning_profile() {
    la ~/Library/MobileDevice/Provisioning\ Profiles
}
function remove_provisioning_profile() {
    rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$1
}
function remove_all_provisioning_profiles() {
    rm -f ~/Library/MobileDevice/Provisioning\ Profiles/*
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

# ffprobe, ffmpeg
function ffmpeg_print() {
  ffprobe -v error -show_format -show_streams "$1"
}

function ffmpeg_reduce_bitrate() {
    input=$1

    filename=$(basename "$input")
    extension="${filename##*.}"
    basename="${filename%.*}"
    output="${input%/*}/$basename""_reduced_bit_rate.$extension"

    ffmpeg -i "$input" -b:v 1M -an "$output"
}

function ffmpeg_convert_to_gif() {
    input=$1

    filename=$(basename "$input")
    basename="${filename%.*}"
    output="${input%/*}/$basename.gif"

    ffmpeg -i "$input" -vf "fps=10,scale=320:-1:flags=lanczos" -c:v pam -f image2pipe - | convert - -filter Lanczos -colors 256 -loop 0 - "$output"
}

# asdf
alias asdfc="asdf current"
alias asdfla="asdf plugin list"
alias asdfl='asdf plugin list | sed "s/^[ *]*//; s/[ *]*\$//" | fzf --height 40% --reverse --inline-info | xargs -I {} sh -c "echo \"{}:\n\$(asdf list {})\""'
alias asdfi='f() { asdf plugin list | fzf -m | xargs -I {} asdf install {} "$1"; }; f'

alias asdfs='
  tool=$(asdf plugin list | sed "s/^[ *]*//; s/[ *]*\$//" | fzf --height 40% --reverse --inline-info --prompt "Select Tool: ")
  if [ -n "$tool" ]; then
    version=$(asdf list $tool | fzf --height 40% --reverse --inline-info --prompt "Select Version: " | sed "s/^[ *]*//; s/[ *]*\$//" | grep -v "^$")
    if [ -n "$version" ]; then
      asdf local $tool $version
    fi
  fi
'
alias asdfg='
  tool=$(asdf plugin list | sed "s/^[ *]*//; s/[ *]*\$//" | fzf --height 40% --reverse --inline-info --prompt "Select Tool: ")
  if [ -n "$tool" ]; then
    version=$(asdf list $tool | fzf --height 40% --reverse --inline-info --prompt "Select Version: " | sed "s/^[ *]*//; s/[ *]*\$//" | grep -v "^$")
    if [ -n "$version" ]; then
      asdf global $tool $version
    fi
  fi
'

# container-use
alias -g E='"$(container-use list | tail -n +2 | fzf --height 40% --reverse --prompt "CONTAINER ID>" | awk "{print \$1}")"'

alias cu="container-use"
alias cul="container-use list"
alias cuco="container-use checkout"
alias cua="container-use apply"
alias cum="container-use merge"
alias cud="container-use delete"
alias cudf="container-use diff"
alias culog="container-use log"
alias cut="container-use terminal"
alias cuw="container-use watch"
alias cuv="container-use version"
