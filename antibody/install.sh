#!/bin/zsh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh

antidote bundle < "$ZSH/antibody/pre_prompt.txt" > ~/.antibody_bundles.txt
antidote bundle dwest-teo/pure >> ~/.antibody_bundles.txt
antidote bundle < "$ZSH/antibody/post_prompt.txt" >> ~/.antibody_bundles.txt
