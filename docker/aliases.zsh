#!/bin/sh
alias dps='docker ps -a'
alias dm='docker $(docker-machine config)'
alias dmps='docker $(docker-machine config) ps -a'
alias dms='docker-machine start'
alias drmi='docker rmi $(docker images -a -q)'
