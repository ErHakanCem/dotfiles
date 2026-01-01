if exists('g:loaded_vim_capture_autoload')
  finish
endif
let g:loaded_vim_capture_autoload = 1

function! capture#to_file(default, opts, first, last) abort
  let l:file = expand(input('Capture to file: ', a:default, 'file'))
  if empty(l:file)
    return
  endif

  " Ensure directory exists
  let l:dir = fnamemodify(l:file, ':h')
  if l:dir !=# '.' && !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif

  let l:ts = strftime('%Y-%m-%d %H:%M')
  let l:header = '## ' . l:ts

  let l:lines = getline(a:first, a:last)

  if get(a:opts, 'task', 0)
    call map(l:lines, '"- [ ] " . v:val')
  elseif get(a:opts, 'bullet', 0)
    call map(l:lines, '"- " . v:val')
  endif

  call writefile([l:header, ''] + l:lines + [''], l:file, 'a')
endfunction

