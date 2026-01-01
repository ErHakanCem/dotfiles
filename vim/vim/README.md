# Vim Configuration Guide

A comprehensive Vim setup with powerful plugins for writing, coding, and note-taking.

## 🚀 Quick Start

- **Leader key**: `Space`
- **Open this help**: `:help` or view this file in Vim
- **Install/Update plugins**: `:PlugInstall` or `:PlugUpdate`

## 📁 Directory Structure

```
~/.vim/
├── autoload/          # Plugin autoload files
├── backup/           # Automatic file backups (.bak files)
├── doc/              # Documentation files
├── plugin/           # Custom plugins
├── plugged/          # Installed plugins (managed by vim-plug)
├── UltiSnips/        # Custom code snippets
├── abbr.vim          # Text abbreviations
└── README.md         # This file
```

## 🔌 Installed Plugins

### File Navigation & Search
- **FZF** - Fuzzy file finder and search
- **vim-startify** - Enhanced start screen with recent files

### UI Enhancements  
- **vim-airline** - Beautiful status bar
- **vim-airline-themes** - Status bar themes
- **vim-gitgutter** - Git diff indicators
- **vim-palette** - Color palette management

### Writing & Markdown
- **vim-pencil** - Better writing experience
- **vim-markdown** - Enhanced Markdown support
- **vim-colors-pencil** - Writing-focused color scheme
- **markdown-preview.nvim** - Live Markdown preview in browser
- **fountain.vim** - Screenplay format support

### Editing Tools
- **vim-abolish** - Smart search/replace and case conversion
- **vim-surround** - Surround text with quotes, brackets, etc.
- **vim-css-color** - Display colors in CSS files
- **vim-cool** - Auto-disable search highlighting
- **vim-skeletons** - File templates
- **vim-auto-save** - Automatic file saving
- **UltiSnips** - Code snippet engine

### Focus & Productivity
- **goyo.vim** - Distraction-free writing mode
- **limelight.vim** - Highlight current paragraph

### Development Tools
- **ALE** - Asynchronous linting and fixing
- **vim-fugitive** - Git integration
- **vim-qf** - Enhanced quickfix window

### Custom Plugins
- **notes.vim** - Zettelkasten note-taking system
- **timestamp_notes.vim** - Timestamped notes for poetry and philosophy

## ⌨️ Key Bindings

### Leader Key Mappings
| Key | Action | Plugin |
|-----|--------|--------|
| `<Space>` | Leader key | - |

### File Navigation (FZF)
| Key | Action | Plugin |
|-----|--------|--------|
| `Ctrl+P` | Open files fuzzy finder | FZF |
| `<leader>b` | Switch between buffers | FZF |
| `<leader>f` | Search in files (ripgrep) | FZF |
| `<leader>/` | Search in current buffer | FZF |
| `<leader>'` | Show marks | FZF |
| `<leader>l` | Search lines in all files | FZF |
| `<leader>t` | Search tags | FZF |
| `<leader>h` | File history | FZF |
| `<leader>h:` | Command history | FZF |
| `<leader>h/` | Search history | FZF |
| `<leader>H` | Help tags | FZF |
| `<leader>s` | Search word under cursor | FZF |

### Git Integration
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>gg` | Git commit history | FZF + Git |

### Focus Mode
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>g` | Toggle Goyo (focus mode) | Goyo |
| `<leader>gy` | Goyo with custom width | Goyo |

### Note Taking (Zettelkasten)
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>nz` | Create new timestamped note | Custom |
| `<leader>wa` | Save with custom timestamp name | Custom |
| `<leader>mp` | Make new note from selection | Custom |

### Text Manipulation
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>c` | Copy to system clipboard (WSL) | - |

### Window Navigation
| Key | Action | Plugin |
|-----|--------|--------|
| `Ctrl+H` | Move to left window | - |
| `Ctrl+J` | Move to bottom window | - |
| `Ctrl+K` | Move to top window | - |
| `Ctrl+L` | Move to right window | - |
| `F4` | Horizontal split + go to file | - |
| `F5` | Vertical split + go to file | - |
| `F8` | Copy selection to other window | - |

### Line Movement
| Key | Action | Plugin |
|-----|--------|--------|
| `Shift+Up` | Move line up | - |
| `Shift+Down` | Move line down | - |

### UltiSnips
| Key | Action | Plugin |
|-----|--------|--------|
| `Tab` | Expand snippet | UltiSnips |
| `Ctrl+J` | Jump to next placeholder | UltiSnips |
| `Ctrl+K` | Jump to previous placeholder | UltiSnips |
| `Ctrl+L` | List available snippets | UltiSnips |

## 📝 Available Snippets

### All Files (`all.snippets`)
- Common snippets available in any file type

### Markdown (`markdown.snippets`) 
- Markdown-specific snippets for faster writing

## 🎨 Syntax Highlighting Features

### Custom Highlighting
- **Single quotes** in Markdown files appear in **yellow bold**
- **Wiki-style links** `[[text]]` appear in **magenta** with hidden brackets
- **Word "hello"** appears in **red** (example custom highlighting)

### Markdown Enhancements
- Concealed formatting markers (level 2)
- Enhanced syntax for better readability

## 🔧 Configuration Features

### File Handling
- **No swap files** - cleaner workspace
- **Automatic backups** in `~/.vim/backup/` with `.bak` extension
- **Auto-read** files when changed externally
- **Recursive file search** with `**` in path

### Display Settings
- **Line numbers** with relative numbering
- **Syntax highlighting** with 256 colors
- **Word wrapping** with line breaks
- **Search count display** (e.g., "3/10 matches")

### Search Configuration
- **Smart case** searching
- **Incremental search**
- **Highlight search results** (auto-disabled when done)

### Sound Effects
- **Mode change sounds** using macOS system sounds:
  - Insert mode: Tink sound
  - Normal mode: Pop sound  
  - Visual mode: Morse/Blow sounds
  - Vim start/exit: Glass sound

## 🗂️ Zettelkasten Note System

Your Vim is configured with a powerful note-taking system:

### Note Directory
- **Location**: `~/Documents/zets/`
- **Format**: Markdown files (`.md`)
- **Naming**: Timestamp-based (YYYYMMDD.HHMM)

### Creating Notes
- `<leader>nz` + name: Create timestamped note
- `<leader>wa`: Save current buffer with timestamp
- Files automatically created in zettelkasten directory

## 🎯 Writing Features

### Enhanced Writing Mode
- **vim-pencil** provides better text editing
- **Goyo** removes distractions
- **Limelight** highlights current paragraph
- **Auto-save** prevents work loss

### Markdown Preview
- Live preview in browser with `markdown-preview.nvim`
- Enhanced Markdown syntax with `vim-markdown`

## 🔨 Maintenance Commands

### Plugin Management
```vim
:PlugInstall    " Install new plugins
:PlugUpdate     " Update all plugins
:PlugClean      " Remove unused plugins
:PlugStatus     " Check plugin status
```

### Help System
```vim
:help           " General help
:help <plugin>  " Plugin-specific help
:help <command> " Command help
```

## 🚀 Advanced Features

### Git Integration
- **Fugitive** provides full Git integration
- **GitGutter** shows diff indicators in gutter
- Commit history accessible via FZF

### Development Tools
- **ALE** for linting and fixing code
- **CSS color preview** in stylesheets  
- **Auto-completion** available

### File Templates
- **vim-skeletons** provides file templates
- Custom templates can be added

## 🎨 Color Schemes

Multiple color schemes available:
- **pencil** - Writing-focused theme
- **vim-airline themes** - Status bar themes
- **vim-palette** - Color management

Switch themes with:
```vim
:colorscheme <theme-name>
```

## 📚 Learning Resources

- **Vim help**: `:help user-manual`
- **Plugin help**: `:help <plugin-name>`
- **Key mappings**: `:map` to list all mappings
- **This guide**: Open `~/.vim/README.md` in Vim

## 🔧 Customization

### Adding Snippets
1. Edit files in `~/.vim/UltiSnips/`
2. Use `:UltiSnipsEdit` to edit current filetype snippets

### Adding Abbreviations
1. Edit `~/.vim/abbr.vim`
2. Reload with `:source ~/.vim/abbr.vim`

### Custom Key Mappings
Add to your `.vimrc`:
```vim
nnoremap <leader>x :YourCommand<CR>
```

---

**Happy Vimming! 🎉**

*Last updated: $(date)*
