#!/usr/bin/fish

set fish_greeting

set -gx BARX_NO_REMOTE_CACHE 1
set -gx NVM_DIR $HOME/.local/nvm
set -gx SHELL /usr/local/bin/fish
set -gx EDITOR nvim
set -gx GOPATH $HOME/src/go
set -gx CLOUDPATH $GOPATH/src/github.com/supersparks/CloudExperiments
set -gx KDEV_KUBE_CONTEXT docker-desktop
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx FZF_DEAFULT_OPTS ' --no-exact'
set -gx GPG_TTY (tty)

set -gx PATH $HOME/bin $GOPATH/bin $HOME/.local/bin $HOME/.pulumi/bin $HOME/.cargo/bin $HOME/.istioctl/bin /usr/local/bin $PATH

alias bat    'bat --theme Dracula'
alias cat    'bat -pp'
alias cdc    'cd $CLOUDPATH'
alias ga     'git add'
alias gapa   'git add -p'
alias gcm    'git commit -S -m'
alias gco    'git checkout'
alias gd     'git diff'
alias gdca   'git diff --cached'
alias gl     'git pull'
alias gp     'git push'
alias gpnew  'git push -u origin (git rev-parse --abbrev-ref HEAD)'
alias gs     'git status'
alias k      'kubectl'
alias kn     'kubens'
alias kx     'kubectx'
alias l      'ls -lh'
alias ll     'ls -lAh'
alias ls     'lsd --group-dirs first'
alias vi     'nvim'
alias vim    'nvim'

alias kdev $CLOUDPATH/kdev.sh
alias barx $CLOUDPATH/barx.sh

fzf_key_bindings
starship init fish | source
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
