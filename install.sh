#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

mkdir -p ~/.config

ln -sf "$DOTFILES/vim/vimrc" ~/.vimrc
ln -sf "$DOTFILES/vim/vim" ~/.vim

ln -sf "$DOTFILES/yazi" ~/.config/yazi
ln -sf "$DOTFILES/ghostty" ~/.config/ghostty

echo "✅ Dotfiles installed"

