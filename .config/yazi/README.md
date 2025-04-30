# Dotfiles

This repository contains my personal dotfiles and configuration settings for various tools and applications.

## Structure

- **bash/** - Bash shell configuration
  - .bashrc - Bash configuration file

- **vim/** - Vim editor configuration
  - .vimrc - Main Vim configuration file
  - .vim/ - Vim directory containing:
    - .colorscheme - Color scheme settings
    - abbr.vim - Vim abbreviations
    - after/syntax/ - Custom syntax highlighting
    - autoload/ - Plugin autoload files
    - plugin/ - Custom plugin configurations

- **zsh/** - Zsh shell configuration
  - .zshrc - Zsh configuration file

- **yazi/** - Yazi file manager configuration
  - package.toml - Package configuration
  - theme.toml - Theme settings
  - yazi.toml - Main configuration file
  - flavors/ - Collection of color schemes and themes
    - ayu-dark.yazi
    - everforest-medium.yazi
    - gruvbox-dark.yazi
    - monokai-vibrant.yazi
    - sunset.yazi

## Installation

Clone this repository to your home directory:

```bash
git clone https://github.com/ErHakanCem/dotfiles.git
```

Create symbolic links for the configuration files:

```bash
# Vim
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/.vim ~/.vim

# Bash
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

# Zsh
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

# Yazi
ln -s ~/dotfiles/yazi ~/.config/yazi
```

## Author

ErHakanCem
