#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables
DOTFILES=$HOME/dotfiles
BACKUP_DIR=$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)
CONFIG_DIR=$HOME/.config

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

backup_file() {
    local file=$1
    if [ -e "$file" ]; then
        local backup_path="${BACKUP_DIR}${file#$HOME}"
        mkdir -p "$(dirname "$backup_path")"
        mv "$file" "$backup_path"
        print_info "Backed up $file to $backup_path"
    fi
}

create_symlink() {
    local source=$1
    local dest=$2
    
    # If the destination is a file or symlink, back it up
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        backup_file "$dest"
    fi
    
    # Create necessary parent directories
    mkdir -p "$(dirname "$dest")"
    
    # Create the symlink
    ln -s "$source" "$dest"
    print_success "Created symlink: $dest -> $source"
}

# Welcome message
echo "======================================================================"
echo "                      Dotfiles Installation                           "
echo "======================================================================"
print_info "This script will set up your dotfiles by creating symlinks in your home directory."
print_info "Existing files will be backed up to $BACKUP_DIR"
echo

# Check if running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_info "Detected macOS system"
else
    print_warning "Not running on macOS. Some features may not work correctly."
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"
print_info "Created backup directory at $BACKUP_DIR"

# Setup shell configuration files
print_info "Setting up shell configuration files..."
shell_files=(".bashrc" ".bash_profile" ".bash_aliases" ".zshrc" ".zprofile" ".fzf.bash" ".fzf.zsh")

for file in "${shell_files[@]}"; do
    source_file="${DOTFILES}/shell/${file}"
    dest_file="${HOME}/${file}"
    
    if [ -f "$source_file" ]; then
        create_symlink "$source_file" "$dest_file"
    else
        print_warning "Source file $source_file does not exist, skipping..."
    fi
done

# Setup .config directory
print_info "Setting up .config directory files..."
config_dirs=("gh" "ghostty" "helix" "iterm2" "linearmouse" "mpv" "raycast" "yazi")

for dir in "${config_dirs[@]}"; do
    source_dir="${DOTFILES}/.config/${dir}"
    dest_dir="${CONFIG_DIR}/${dir}"
    
    if [ -d "$source_dir" ]; then
        if [ -d "$dest_dir" ] || [ -L "$dest_dir" ]; then
            backup_file "$dest_dir"
        fi
        
        # Create parent directory if it doesn't exist
        mkdir -p "$CONFIG_DIR"
        
        # Create the symlink for the entire directory
        ln -s "$source_dir" "$dest_dir"
        print_success "Created symlink for directory: $dest_dir -> $source_dir"
    else
        print_warning "Source directory $source_dir does not exist, skipping..."
    fi
done

# Special handling for oh-my-zsh if needed
if [ -d "$HOME/.oh-my-zsh" ]; then
    print_info "oh-my-zsh installation detected."
    print_info "Note: oh-my-zsh is typically installed via its installer and not symlinked."
    print_info "Custom oh-my-zsh themes or plugins should be backed up separately."
else
    print_warning "oh-my-zsh not detected. You might want to install it separately."
    print_info "Run: sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

# Check for .zsh directory
if [ -d "$DOTFILES/.zsh" ]; then
    if [ -d "$HOME/.zsh" ] || [ -L "$HOME/.zsh" ]; then
        backup_file "$HOME/.zsh"
    fi
    ln -s "$DOTFILES/.zsh" "$HOME/.zsh"
    print_success "Created symlink for .zsh directory"
else
    print_warning ".zsh directory not found in dotfiles, skipping..."
fi

# Final message
echo
echo "======================================================================"
print_success "Dotfiles installation complete!"
print_info "Backed up files can be found in: $BACKUP_DIR"
print_info "You may need to restart your terminal or run 'source ~/.zshrc' (or ~/.bashrc) to see changes."
echo "======================================================================"

