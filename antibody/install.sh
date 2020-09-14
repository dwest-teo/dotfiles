#!/bin/sh
# if [ "$(uname -s)" != "Darwin" ]; then
#   exit 0
# fi
antibody bundle < "$ZSH/antibody/pre_prompt.txt" > ~/.antibody_bundles.txt
antibody bundle dwest-teo/pure >> ~/.antibody_bundles.txt
antibody bundle < "$ZSH/antibody/post_prompt.txt" >> ~/.antibody_bundles.txt
