# MacOS Dotfiles

# Setup

1. Install requirements via `homebrew`

```sh
brew install yabai skhd alacritty starship fish stow
```

2. Install neovim from the master branch

```sh
git clone https://github.com/neovim/neovim
cd neovim
make
sudo make install
```

3. Clone this repository somewhere in your home folder. I use `~/.dotfiles`

```sh
git clone https://github.com/itmecho/dotfiles-mac ~/.dotfiles
```

4. Symlink config files for each application using `stow`. I prefer to remove any existing files so that the whole folder will get symlinked

```sh
cd ~/.dotfiles
stow alacritty # for example
```
