# Dotfiles

This repository contains my personal dotfiles for various tools and shell configurations. It's designed to make setting up a new machine quick and easy while maintaining consistent configurations across different environments.

## What's Included

This dotfiles repository includes configurations for:

### Shell Configuration
- Bash (`.bash_profile`, `.bashrc`, `.bash_aliases`)
- Zsh (`.zshrc`, `.zprofile`)
- FZF integration for both Bash and Zsh (`.fzf.bash`, `.fzf.zsh`)

### Application Configurations (`.config/`)
- **gh**: GitHub CLI configuration
- **ghostty**: Terminal emulator settings
- **helix**: Text editor configuration
- **iterm2**: Terminal emulator settings
- **linearmouse**: Mouse/trackpad customization
- **mpv**: Media player settings
- **raycast**: Productivity tool extensions and settings
- **yazi**: File manager configuration

## Installation

### Prerequisites
- Git
- Bash or Zsh shell
- For complete functionality:
  - [Oh My Zsh](https://ohmyz.sh/) (for zsh users)
  - [FZF](https://github.com/junegunn/fzf) (fuzzy finder)
  - [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) (for proper icon rendering)
  - [bat](https://github.com/sharkdp/bat) (used with FZF for file previews)
  - [chafa](https://hpjansson.org/chafa/) (for image previews in Yazi)

### Automatic Installation

1. Clone this repository:
   ```bash
   git clone git@github.com:ErHakanCem/dotfiles.git ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

The script will:
- Create backups of any existing configuration files
- Set up symbolic links from your home directory to the dotfiles
- Provide feedback on the installation process

### Manual Installation

If you prefer to set up specific components manually:

1. Create symbolic links for the shell files:
   ```bash
   ln -s ~/dotfiles/shell/.zshrc ~/.zshrc
   ln -s ~/dotfiles/shell/.bashrc ~/.bashrc
   # Repeat for other shell files as needed
   ```

2. Create symbolic links for config directories:
   ```bash
   ln -s ~/dotfiles/.config/yazi ~/.config/yazi
   # Repeat for other config directories as needed
   ```

## Special Configurations

### FZF with bat
The FZF configuration uses `bat` for syntax-highlighted file previews. This provides a more readable preview with syntax highlighting when browsing files with FZF.

### Yazi File Manager
The Yazi configuration includes:
- Image previews using `chafa` with specific settings for optimal display
- Custom opener configurations for different file types and platforms
- Enhanced visual presentation

### Shell Customizations
- The `ls` command is configured to show different colors for folders, links, or files
- Custom aliases and functions for improved productivity

## Customization

Feel free to fork this repository and customize it to your needs. The modular structure makes it easy to add or remove specific configurations.

## Maintenance

To update your dotfiles after making changes:

1. Make changes to the relevant files in the dotfiles repository
2. Commit and push your changes to GitHub:
   ```bash
   cd ~/dotfiles
   git add .
   git commit -m "Update description here"
   git push
   ```

3. On any other machine using these dotfiles, pull the latest changes:
   ```bash
   cd ~/dotfiles
   git pull
   ```

## License

This repository is available under the MIT License. Feel free to use, modify, and distribute as you see fit.

