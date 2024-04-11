#!/usr/bin/env bash

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

change_background() {
    dconf write /org/mate/desktop/background/picture-filename "'$HOME/bg/$(ls ~/bg| fzf)'"
}

die () {
    echo >&2 "$@"
    exit 1
}
