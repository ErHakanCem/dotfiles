" Vim Configuration File
" Install vim-plug if not present:
" Unix/Linux:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" ==============================================================================
" Basic Settings
" ==============================================================================
set nocompatible              " Be iMproved, required
" Set leader key
let mapleader = " "           " Map leader to Space

" Basic display settings
set nocursorline
set wrap
set linebreak
set t_Co=256
syntax on

" Custom highlighting for single quotes (in Markdown files)
autocmd BufEnter *.md syntax match markdownSingleQuotes /'[^']*'/
autocmd BufEnter *.md highlight markdownSingleQuotes ctermfg=yellow guifg=yellow gui=bold cterm=bold

set number                    " Enable line numbers
set relativenumber            " Relative line numbers
set nospell                   " Disable spell checking
set nonu                      " No line numbers (overridden by number above)

" Search and file navigation
set path+=**                " Enable recursive file search in subdirectories
set suffixesadd+=.txt,.md,.py  " Add file extensions for the 'gf' command to find files
set isfname-=[,]              " Exclude square brackets from filename patterns
set wildignore+=*.md,*.txt
set wildmode=list:longest     " Display all matching files when tab complete, then cycle through
set wildmenu                  " Command-line completion with a menu
set autoread
set shortmess-=S              " Show search count message when searching (3/10 matches)
set conceallevel=2            " Hide formatting markers in markdown, e.g., replace ** with bold text

" Backup and swap settings - Disables swap files but enables backups in a separate directory
set noswapfile               " Don't create swap files for open buffers
set backup                   " Create backups of files when saved
set backupdir=~/.vim/backup  " Use a custom backup directory
set backupext=.bak           " Optional: Change the extension for backups

" Cursor settings
" Changes the cursor shape in different modes (requires terminal support)
let &t_SI = "\e[3 q"         " Insert mode: vertical bar cursor
let &t_EI = "\e[2 q"         " Normal mode: block cursor

" Mode change sound effects
augroup ModeChangeSound
    autocmd!
    " Different sounds for different mode changes
    autocmd InsertEnter * silent! !afplay /System/Library/Sounds/Tink.aiff &
    autocmd InsertLeave * silent! !afplay /System/Library/Sounds/Pop.aiff &
    autocmd VimEnter,VimLeave * silent! !afplay /System/Library/Sounds/Glass.aiff &
    autocmd ModeChanged *:[vV\x16]* silent! !afplay /System/Library/Sounds/Morse.aiff &
    autocmd ModeChanged [vV\x16]*:* silent! !afplay /System/Library/Sounds/Blow.aiff &
augroup END

" Reduce delay for mode change sound
set updatetime=250

" Allow filetype detection for plugins and indentation
filetype plugin indent on

" ==============================================================================
" Plugin Management with vim-plug
" ==============================================================================
call plug#begin('~/.vim/plugged')

" FZF and search - Fast fuzzy file finding and search utilities
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" UI Enhancements - Status line, Git indicators and visual improvements
Plug 'vim-airline/vim-airline'         " Enhanced status bar
" vim-airline-themes provides color schemes for the airline status bar
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'airblade/vim-gitgutter'          " Git diff indicators in the gutter
Plug 'mhinz/vim-startify'              " Start screen with recent files
Plug 'gmist/vim-palette'               " Color palette

" Markdown and text editing - Tools for writing in Markdown and plain text
Plug 'preservim/vim-pencil'            " Better writing experience for text
Plug 'preservim/vim-markdown'          " Enhanced Markdown support
Plug 'preservim/vim-colors-pencil'     " Pencil color scheme for writing
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}  " Preview Markdown in browser
Plug 'vim-scripts/fountain.vim'        " Screenplay format support

" Editing enhancements
Plug 'tpope/vim-abolish'      " Smart search/replace and word case conversion
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'romainl/vim-cool'       " Automatically disables search highlighting when done
" Plug 'vim-scripts/AutoComplPop'  " Removed to avoid Tab key conflicts with UltiSnips
Plug 'pgilad/vim-skeletons'
Plug '907th/vim-auto-save'    " Automatically saves changes

" Snippet engine only (we use custom snippets in ~/.vim/UltiSnips/)
Plug 'SirVer/ultisnips'
" Focus mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Misc utilities
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'             " Required for colorscheme-switcher
Plug 'gerw/vim-HiLinkTrace'
Plug 'Taverius/vim-colorscheme-manager'

" Additional plugins
Plug 'dense-analysis/ale'
Plug '~/.vim/plugin/notes.vim'
Plug 'tpope/vim-fugitive'        " Git integration
Plug 'romainl/vim-qf'

call plug#end()

" ==============================================================================
" Plugin Configuration
" ==============================================================================

" vim-goyo and limelight integration
let g:limelight_default_coefficient = 0.7
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <silent> <leader>g :Goyo<CR>
nnoremap <silent> <leader>gy :Goyo 150<CR>

" vim auto save plugin
let g:auto_save = 1                " Enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " Do not save while in insert mode

" FZF configuration
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-p> :Files!<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>gg :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>l :Lines<CR>

" FZF Layout
let g:fzf_layout = { 'down': '~40%' }
" Enable preview window
let g:fzf_preview_window = ['right:65%', 'ctrl-/']
" Default search command using Ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
" Add custom options to FZF
let $FZF_DEFAULT_OPTS = '--height=40% --reverse --border'

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"         " Use Tab to expand snippet
let g:UltiSnipsJumpForwardTrigger="<c-j>"    " Use Ctrl+j to jump forward
let g:UltiSnipsJumpBackwardTrigger="<c-k>"   " Use Ctrl+k to jump backward
let g:UltiSnipsListSnippets="<c-l>"          " Use Ctrl+l to list snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsUsePythonVersion=3

" Ensure proper snippet loading for all filetypes
augroup ultisnips_custom
    autocmd!
    " Refresh snippets when entering any buffer
    autocmd BufEnter * call UltiSnips#RefreshSnippets()
augroup END
" ==============================================================================
" Custom Keybindings
" ==============================================================================

" Copy to clipboard in WSL
vnoremap <leader>c :w !clip.exe<CR>

" Easy line movement
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split window navigation
nnoremap <F4> :split<CR><C-w>w<CR>gf
nnoremap <F5> :vsplit<CR><C-w>w<CR>gf

" Send text from one split window to another
vnoremap <F8> y<c-w>wp<c-w>pgv

" Search the word under cursor using FZF
nnoremap <leader>s :call FzfSearchWord()<CR>

" ==============================================================================
" Custom Functions
" ==============================================================================

" FzfSearchWord: Search for the word under cursor with ripgrep
function! FzfSearchWord()
  let word = expand('<cword>')
  let command = 'rg --vimgrep ' . shellescape(word)
  call fzf#vim#grep(command, 1, fzf#vim#with_preview(), 0)
endfunction

" ==============================================================================
" Syntax and Highlighting Configuration - Custom syntax matching and visual styling
" ==============================================================================

" Ensure .md files are recognized as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Custom highlighting - Define special highlighting for specific words and patterns
augroup CustomHighlight
  autocmd!
  " Match specific word and highlight it in red
  autocmd Syntax * syntax match Word "\<hello\>" 
  autocmd Syntax * highlight Word ctermfg=red guifg=red
  
  " Match [[word]] pattern and conceal brackets (for wiki-style links)
  autocmd Syntax * syntax region BracketWord matchgroup=Conceal start="\[\[" end="\]\]" concealends containedin=ALL  
  " Set the color to purple 
  autocmd Syntax * highlight BracketWord ctermfg=magenta guifg=#C678DD
augroup END

" Custom highlighting for single quotes in Markdown files
augroup MarkdownSingleQuotes
  autocmd!
  " Match text between single quotes and highlight in yellow
  autocmd FileType markdown syntax match markdownSingleQuotes /'[^']*'/ containedin=ALL
  autocmd FileType markdown highlight markdownSingleQuotes ctermfg=yellow guifg=yellow cterm=bold gui=bold
augroup END

" Conceal settings
set concealcursor=nc         " Concealed text remains hidden when cursor is on line in normal and command modes

" ==============================================================================
" Zettelkasten Notes Configuration
" ==============================================================================
" Zettelkasten Notes Configuration - Personal knowledge management system
" ==============================================================================

" Notes path - Directory where all notes will be stored
let g:zettelkasten = '~/Documents/zets/'
command! -nargs=1 NewZettel :execute ":e" zettelkasten. strftime("%Y%m%d.%H%M") . " <args>".".md"
nnoremap <leader>nz :NewZettel 
" Save note with custom name
nnoremap <leader>wa :let custom_word = input("Enter custom word: ") <Bar> exe "w " . strftime("%Y%m%d.%H%M") . " " . custom_word . ".md"<CR>

" Integration with notes plugin
vnoremap <leader>mp :call notes#make_new_note()<CR>

" Load abbreviations
if filereadable(expand("~/.vim/abbr.vim"))
  source ~/.vim/abbr.vim
endif

" Create Zettelkasten directory if it doesn't exist
if !isdirectory(expand(g:zettelkasten))
  call mkdir(expand(g:zettelkasten), 'p')
endif
