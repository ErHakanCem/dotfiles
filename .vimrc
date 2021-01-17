
" setting genaral {{{ 
filetype plugin on
syntax on
colorscheme desert
let mapleader = " "
"set pastetoggle=<F3>
set clipboard=unnamed

" setting vim {{{1 
"set mouse=a
set foldmethod=marker
set foldcolumn=5
set modeline
set nocompatible
set viminfo+=n~/.vim/viminfo
set complete+=kspell
set laststatus=1
set undofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set clipboard=unnamedplus
set t_Co=256
" search down into subfolders
set path+=**
" display all matching files when we tab complete
set wildmenu
set encoding=utf-8
set thesaurus+=/home/omay/.vim/dict/words.txt

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" " Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" " Default: 0.5
let g:limelight_default_coefficient = 0.7


let g:abolish_save_file = expand("~/.vim/pack/apps/start/abolish/after/plugin/abolish.vim")


"nnoremap <leader>d :r!  date
inoremap jk <ESC>
iab <expr> tds strftime("%F %b %T")
"Send text from one split window to another
vnoremap <F5> y<c-w>wp<c-w>pgv
"from luke vimrc 
nnoremap <F4> :close
"add momentarily thoughts to txt file
nnoremap N :!echo >>thoughts.txt  <left>
" Automatically save and load Vim views / folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" AutoSave 
" enable AutoSave on Vim startup
let g:auto_save = 1 
" do not save while in insert mode
let g:auto_save_in_insert_mode = 0 

" goyo 
" when you turn Goyo on, it turns Limelight on
nnoremap <Leader>g :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_width = 100 
" cursor goes up
" inoremap <enter> <esc>O
" inoremap <Enter> <C-o>O
" nnoremap <leader>f :iunmap <lt>cr><cr>
" nnoremap <leader>n :inoremap <lt>cr> <C-o>O<cr>
" change key ;
nnoremap ; :

filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1

" tags extension ???{{{1
" to search our notes and only our notes.
" Vim to generate the tags silently
nnoremap <leader>tt :silent !ctags -R . <CR>:redraw!<CR>

set ignorecase
set tags+=./tags;,tags
" to open file in new vertical split window
map gv :vertical wincmd f<CR>
" to open file in new horizontal split window
map gs :above wincmd f<CR>
map <F4> :close<CR>
inoremap <Enter> <C-o>O

set splitright
"explanation:
"xnoremap <F5>  Remap F5 in visual/select mode (could be any key combo)
"y copy selected text
"<c-w>w .... switch to next window
"p... paste (for terminals this sends the text to the terminal)
"<c-w>p switch to previous window                                                    
"gv reselect
vnoremap <F5> y<c-w>wp<c-w>pgv

"" FZF Vim integration {{{1
set rtp+=~/.fzf

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap \ :Find<SPACE>
nnoremap <C-p> :Files<Cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :Tags<cr>
nmap <silent> <leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

map <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"notes directoy {{{1

let g:zettelkasten = "/home/omay/notes/Zettelkasten/"
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>nz :NewZettel 
function! HandleFZF(file)
"let filename = fnameescape(a:file)
let filename = fnameescape(fnamemodify(a:file, ":t"))
let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
put=mdlink
endfunction

command! -nargs=1 HandleFZF :call fzf#run({'sink': 'HandleFZF'})
" Find backlinks to current file and open quickfix list with the results  
 command! -nargs=0 Ngrepl :execute "grep -F '" . " ]( " . expand("%:t") . " )" .  "'" | :copen  

 nnoremap <leader>nb :Ngrepl<CR><CR>
"Go to index of notes and set working directory to my notes
"
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>


" Thus depends on grepprg being set to rg
" My own version, only searches markdown as well using ripgrep
nnoremap <leader>nn :Ngrep 
command! -nargs=1 Ngrep grep "<args>" -g "*.md" $NOTES_DIR

command! Vlist botright vertical copen | vertical resize 50
nnoremap <leader>v :Vlist<CR>
