#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
mkdir -p "$HOME/.config/kitty"
ln -sf "$ZSH/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
