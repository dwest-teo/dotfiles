#!/bin/sh
# export GOROOT="/usr/local/opt/go/libexec"
# export GOROOT="/usr/local/go"

if [ "$(uname -s)" == "Darwin" ]; then
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

if [ "$(uname -s)" == "Linux" ]; then
  export GOPATH="$HOME/go"
  export GOROOT="/usr/bin/go"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi
