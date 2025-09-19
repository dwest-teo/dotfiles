#!/bin/zsh
source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh

antibody() {
  eval "$(command antibody init -)"
  antibody "$@"
}
