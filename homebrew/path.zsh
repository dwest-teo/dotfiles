#!/bin/sh
if [ "$(arch)" = "arm64" ]; then
 eval $(/opt/homebrew/bin/brew shellenv);
 export PATH="$PATH:/usr/local/bin:/usr/local/sbin";
else
 eval $(/usr/local/bin/brew shellenv);
 export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin";
fi
