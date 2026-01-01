if exists('g:loaded_vim_capture')
  finish
endif
let g:loaded_vim_capture = 1

" Defaults (user can override in vimrc)
if !exists('g:capture_default_file')
  let g:capture_default_file = 'worksheet-antea.md'
endif

let s:opts_plain  = {}
let s:opts_bullet = {'bullet': 1}
let s:opts_task   = {'task': 1}

" Commands
command! -range Capture       call capture#to_file(g:capture_default_file, s:opts_plain, <line1>, <line2>)
command! -range CaptureBullet call capture#to_file(g:capture_default_file, s:opts_bullet, <line1>, <line2>)
command! -range CaptureTask   call capture#to_file(g:capture_default_file, s:opts_task, <line1>, <line2>)

" Mappings (visual)
xnoremap <silent> <leader>c :Capture<CR>
xnoremap <silent> <leader>cb :CaptureBullet<CR>
xnoremap <silent> <leader>ct :CaptureTask<CR>

" Mappings (normal – capture current line)
nnoremap <silent> <leader>c  :Capture<CR>
nnoremap <silent> <leader>ct :CaptureTask<CR>



