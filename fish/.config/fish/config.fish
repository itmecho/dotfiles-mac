#!/usr/bin/fish

set fish_greeting

set -gx BARX_NO_REMOTE_CACHE 1
set -gx NVM_DIR $HOME/.local/nvm
set -gx TERM xterm-256color
set -gx SHELL /usr/bin/fish
set -gx EDITOR nvim
set -gx GOPATH $HOME/src/go
set -gx CLOUDPATH $HOME/src/CloudExperiments
set -gx KDEV_KUBE_CONTEXT docker-desktop
set -gx FZF_DEFAULT_COMMAND 'fd -H'
set -gx FZF_DEFAULT_OPTS ' --no-exact'
set -gx GPG_TTY (tty)

set -U fish_user_paths \
   $GOPATH/bin \
   $HOME/.local/bin \
   $HOME/.cargo/bin \
   $HOME/.istioctl/bin \
   /usr/local/opt/node@12/bin

source ~/.config/fish/aliases.fish

gpg-connect-agent updatestartuptty /bye >/dev/null

fzf_key_bindings
starship init fish | source

source "/opt/google-cloud-sdk/path.fish.inc"
source ~/.local/venv/bin/activate.fish

test -z $DISPLAY
and test (tty) = "/dev/tty1"
and startx
