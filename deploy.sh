#!/bin/sh

##
## Suckless
##
rsync -a --exclude='.git' /etc/dwm ./
rsync -a --exclude='.git' /etc/st ./
rsync -a --exclude='.git' /etc/slstatus ./
rsync -a --exclude='.git' /etc/surf ./
rsync -a --exclude='.git' /etc/slock ./

##
## General config
##
mkdir -p .config
mkdir -p .local/share/nvim

cp ~/.xinitrc ./
cp ~/.zshrc ./

rsync -a --exclude='.git' ~/.oh-my-zsh ./
rsync -a --exclude='.git' ~/.scripts ./
rsync -a --exclude='.git' ~/.local/share/nvim/plugged .local/share/nvim/
rsync -a --exclude='.git' ~/.screenlayout ./

cp ~/.config/compton.conf .config/
rsync -a --exclude='.git' ~/.config/alacritty ./.config/
rsync -a --exclude='.git' ~/.config/nvim ./.config/
