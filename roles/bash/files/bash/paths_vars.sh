#!/usr/bin/env bash

addToPath $GOPATH/bin
addToPath $DOTFILES_DIR/bin
addToPath $HOME/.cargo/bin
addToPathFront $XDG_BIN_HOME
