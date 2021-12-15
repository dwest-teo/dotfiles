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
    aaronthomas.vscode-snazzy-operator
    andrejunges.Handlebars
    blanu.vscode-styled-jsx
    BriteSnow.vscode-toggle-quotes
    burkeholland.simple-react-snippets
    christian-kohler.npm-intellisense
    christian-kohler.path-intellisense
    dbaeumer.vscode-eslint
    dcortes92.FreeMarker
    donjayamanne.githistory
    EditorConfig.EditorConfig
    eg2.vscode-npm-script
    esbenp.prettier-vscode
    flowtype.flow-for-vscode
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
    idleberg.applescript
    joshpeng.sublime-babel-vscode
    mauve.terraform
    mikestead.dotenv
    ms-azuretools.vscode-docker
    ms-vscode.Go
    naumovs.color-highlight
    PKief.material-icon-theme
    rebornix.ruby
    samverschueren.linter-xo
    whtouche.vscode-js-console-utils
    wingrunr21.vscode-ruby
  "
  for module in $modules; do
    code --install-extension "$module" || true
  done
fi
