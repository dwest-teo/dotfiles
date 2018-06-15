#!/bin/sh
if test "$(which code)"; then
  if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_HOME="$HOME/Library/Application Support/Code"
  else
    VSCODE_HOME="$HOME/.config/Code"
  fi

  ln -sf "$ZSH/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
  ln -sf "$ZSH/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"

  # from `code --list-extensions`
  modules="
    EditorConfig.EditorConfig
    PKief.material-icon-theme
    PeterJausovec.vscode-docker
    aaronthomas.vscode-snazzy-operator
    alefragnani.project-manager
    andrejunges.Handlebars
    blanu.vscode-styled-jsx
    chiragpat.tomorrow-and-tomorrow-night-operator-mono-theme
    christian-kohler.npm-intellisense
    christian-kohler.path-intellisense
    dbaeumer.vscode-eslint
    donjayamanne.githistory
    eg2.vscode-npm-script
    flowtype.flow-for-vscode
    formulahendry.auto-close-tag
    idleberg.applescript
    joshpeng.sublime-babel-vscode
    jpoissonnier.vscode-styled-components
    mauve.terraform
    msjsdiag.debugger-for-chrome
    naumovs.color-highlight
    rebornix.Ruby
    samverschueren.linter-xo
  "
  for module in $modules; do
    code --install-extension "$module" || true
  done
fi
