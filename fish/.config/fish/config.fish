#!/usr/bin/fish

set fish_greeting
set -gx PATH $HOME/bin $GOPATH/bin $HOME/.local/bin $HOME/.pulumi/bin $HOME/.cargo/bin $HOME/.istioctl/bin /usr/local/bin $PATH
set -gx CLOUDPATH $HOME/src/CloudExperiments
set -gx KDEV_KUBE_CONTEXT docker-desktop
# set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths

set -gx BARX_NO_REMOTE_CACHE 1
set -gx NVM_DIR $HOME/.local/nvm
set -gx SHELL /usr/local/bin/fish
set -gx GOPATH $HOME/src/go
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx FZF_DEAFULT_OPTS ' --no-exact'
set -gx GPG_TTY (tty)

alias cat    'bat -pp --theme Dracula'
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

alias kdev $HOME/src/CloudExperiments/kdev.sh
alias barx $HOME/src/CloudExperiments/barx.sh

fzf_key_bindings
starship init fish | source
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
