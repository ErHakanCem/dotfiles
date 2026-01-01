" zet.vim - Zettelkasten note-taking plugin for Vim
" Maintainer: Your Name
" Version: 1.0.2 (Optimized for Ripgrep/rg)

" -----------------------------------------------------------------------------
" 1. Initialization Guard
" -----------------------------------------------------------------------------
if exists('g:loaded_zet')
  finish
endif
let g:loaded_zet = 1

" -----------------------------------------------------------------------------
" 5. User Commands and Mappings (Calling the Autoloaded functions)
" -----------------------------------------------------------------------------

" User Commands
command! -nargs=1 ZetNew call zet#new(<q-args>)
command! -nargs=0 ZetLink call zet#search_note()
command! -nargs=0 ZetFollow call zet#follow_link()
command! -nargs=0 ZetReferences call zet#references()
command! -nargs=0 ZetSearch call zet#search_all()
command! -nargs=1 ZetGrep call zet#grep(<q-args>)
command! -nargs=0 ZetTags call zet#tags()
command! -nargs=0 ZetInit call zet#init()

" Mappings (using the <Plug> mappings that call the autoloaded functions)
inoremap <Plug>(zet-search-note-internal) <c-o>:call zet#search_note()<cr>
imap <expr> <Plug>(zet-link) zet#link()
xnoremap <Plug>(zet-make-new-note) :<c-u>call zet#make_new_note()<cr>
nnoremap <Plug>(zet-follow-link) :call zet#follow_link()<cr>
