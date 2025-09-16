#!/bin/sh
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -S -m'
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gs='git status -sb'
alias gcb='git-copy-branch-name'
alias gst='git status'
alias grh='git reset HEAD'
alias gfu='git fetch upstream'
alias gusub='git submodule update --recursive --remote'
alias gcd='git checkout development && git pull'

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}

# auto start and add CD key in WSL
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add ~/.ssh/id_ed25519_2
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add ~/.ssh/id_ed25519_2
fi

unset env
