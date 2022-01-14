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
    alexkrechik.cucumberautocomplete
    andrejunges.Handlebars
    bradlc.vscode-tailwindcss
    BriteSnow.vscode-toggle-quotes
    burkeholland.simple-react-snippets
    christian-kohler.npm-intellisense
    christian-kohler.path-intellisense
    dbaeumer.vscode-eslint
    dcortes92.FreeMarker
    donjayamanne.githistory
    eamodio.gitlens
    EditorConfig.EditorConfig
    eg2.vscode-npm-script
    esbenp.prettier-vscode
    flowtype.flow-for-vscode
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
    GitHub.vscode-pull-request-github
    golang.go
    GraphQL.vscode-graphql
    hashicorp.terraform
    idleberg.applescript
    joshpeng.sublime-babel-vscode
    jpoissonnier.vscode-styled-components
    kvnxush.one-dark-operator-theme
    mikestead.dotenv
    ms-azuretools.vscode-docker
    ms-vscode-remote.remote-containers
    naumovs.color-highlight
    neilding.language-liquid
    octref.vetur
    PKief.material-icon-theme
    rebornix.ruby
    stylelint.vscode-stylelint
    whizkydee.material-palenight-theme
    whtouche.vscode-js-console-utils
    wingrunr21.vscode-ruby
  "
  for module in $modules; do
    code --install-extension "$module" || true
  done
fi
