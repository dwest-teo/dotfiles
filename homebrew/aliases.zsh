#!/bin/sh
if which brew >/dev/null 2>&1; then
  brew() {
    case "$1" in
      cleanup)
        command brew cleanup
        command brew prune
        rm -rf "$(brew --cache)"
        ;;
      bump)
        command brew update
        command brew upgrade
        brew cleanup
        ;;
      *)
        command brew "$@"
        ;;
    esac
  }
fi
