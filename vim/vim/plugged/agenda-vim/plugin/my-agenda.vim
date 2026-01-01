" notes.vim - Simple Daily/Weekly/Monthly Notes Plugin
" Maintainer: Your Name
" Version: 1.0

if exists('g:loaded_notes_plugin')
    finish
endif
let g:loaded_notes_plugin = 1

" Configuration - User can override these in .vimrc
if !exists('g:notes_dir')
    let g:notes_dir = expand('~/my-self/01-doing/writing/notes')
endif

if !exists('g:notes_daily_dir')
    let g:notes_daily_dir = g:notes_dir . '/daily'
endif

if !exists('g:notes_weekly_dir')
    let g:notes_weekly_dir = g:notes_dir . '/weekly'
endif

if !exists('g:notes_monthly_dir')
    let g:notes_monthly_dir = g:notes_dir . '/monthly'
endif

if !exists('g:notes_week_format')
    " Week format: YYYY-Wxx (e.g., 2025-W29)
    let g:notes_week_format = '%Y-W%V'
endif

if !exists('g:notes_month_format')
    " Month format: YYYY-MM (e.g., 2025-07)
    let g:notes_month_format = '%Y-%m'
endif

" Function to ensure a directory exists
function! s:EnsureDir(dir)
    if !isdirectory(a:dir)
        call mkdir(a:dir, 'p')
    endif
endfunction

" Function to open daily note
function! s:OpenDailyNote()
    call s:EnsureDir(g:notes_daily_dir)
    
    let l:today = strftime('%Y-%m-%d')
    let l:filename = g:notes_daily_dir . '/' . l:today . '.md'
    let l:file_exists = filereadable(l:filename)
    
    execute 'edit' l:filename
    
    if !l:file_exists
        call append(0, [
"\ '# Daily Note - ' . l:today,
"\ '',
            \ '- Tasks:',
	    \ '',
            \ '- [ ] ',
            \ '',
            \ '- Focus:',
            \ '',
            \ '- Journal:',
            \ ''
        \ ])
        normal! 4G$
    endif
endfunction

" Function to open weekly note
function! s:OpenWeeklyNote()
    call s:EnsureDir(g:notes_weekly_dir)
    
    let l:week = strftime(g:notes_week_format)
    let l:week_start = strftime('%Y-%m-%d', localtime() - (strftime('%u') - 1) * 86400)
    let l:week_end = strftime('%Y-%m-%d', localtime() + (7 - strftime('%u')) * 86400)
    let l:filename = g:notes_weekly_dir . '/' . l:week . '.md'
    let l:file_exists = filereadable(l:filename)
    
    execute 'edit' l:filename
    
    if !l:file_exists
        call append(0, [
            \ '# Weekly Note - ' . l:week,
            \ '**Week of ' . l:week_start . ' to ' . l:week_end . '**',
            \ '',
            \ '## Goals',
            \ '- [ ] ',
            \ '',
            \ '## Summary',
            \ '',
            \ '## Highlights',
            \ '',
            \ '## Learnings',
            \ ''
        \ ])
        normal! 5G$
    endif
endfunction

" Function to open monthly note
function! s:OpenMonthlyNote()
    call s:EnsureDir(g:notes_monthly_dir)
    
    let l:month = strftime(g:notes_month_format)
    let l:month_name = strftime('%B %Y')
    let l:filename = g:notes_monthly_dir . '/' . l:month . '.md'
    let l:file_exists = filereadable(l:filename)
    
    execute 'edit' l:filename
    
    if !l:file_exists
        call append(0, [
            \ '# Monthly Note - ' . l:month_name,
            \ '',
            \ '## Goals',
            \ '- [ ] ',
            \ '',
            \ '## Projects',
            \ '',
            \ '## Achievements',
            \ '',
            \ '## Reflections',
            \ '',
            \ '## Next Month',
            \ ''
        \ ])
        normal! 4G$
    endif
endfunction

" Define commands
command! Daily call s:OpenDailyNote()
command! Weekly call s:OpenWeeklyNote()
command! Monthly call s:OpenMonthlyNote()

" Optional: Define key mappings (users can override in .vimrc)
if !exists('g:notes_no_mappings')
    nnoremap <leader>nd :Daily<CR>
    nnoremap <leader>nw :Weekly<CR>
    nnoremap <leader>nm :Monthly<CR>
endif
