#!/bin/sh
# export GOROOT="/usr/local/opt/go/libexec"
export GOROOT="$(brew --prefix golang)/libexec"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
