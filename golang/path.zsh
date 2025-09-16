#!/bin/sh
# export GOROOT="/usr/local/opt/go/libexec"
# export GOROOT="/usr/local/go"

# if [ "$(uname -s)" == "Darwin" ]; then
#   export GOPATH="$HOME/go"
#   export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
# fi

# if [ "$(uname -s)" == "Linux" ]; then
#   export GOPATH="$HOME/go"
#   export GOROOT="/usr/bin/go"
#   export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
# fi

# temp to work with WSL, figure out why the uname check didn't work
export GOPATH="$HOME/go"
export GOROOT="/usr/bin/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
