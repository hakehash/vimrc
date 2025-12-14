"See :help nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
augroup RestoreCursorPosition
  autocmd!
  autocmd BufReadPre * autocmd FileType <buffer> ++once
        \ let s:line = line("'\"")
        \ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
        \      && index(['xxd', 'gitrebase'], &filetype) == -1
        \      && !&diff
        \ |   execute "normal! g`\""
        \ | endif
augroup END
augroup RestoreCursorShape
  autocmd!
  autocmd VimEnter,VimResume * set guicursor&
  autocmd VimEnter,VimResume * set guicursor+=n-v-i-r:Cursor/lCursor
  if has('win32')
    autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon500-blinkoff500
  else
    autocmd VimLeave,VimSuspend * set guicursor=a:block-blinkon500-blinkoff500
  endif
augroup END
augroup SearchCountTimer
  autocmd!
  autocmd CursorMoved,CursorMovedI * let s:searchcount_timer = timer_start(100, function('s:update_searchcount'))
augroup END
augroup TermStartInsert
  autocmd!
  autocmd TermOpen * startinsert
augroup END
function! s:update_searchcount(timer) abort
  if a:timer ==# s:searchcount_timer
    call searchcount(#{recompute: 1, maxcount: 0, timeout: 100})
    redrawstatus
  endif
endfunction
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
set cpoptions+=_
set clipboard=unnamedplus
set cmdheight=0
set helplang=en
set inccommand=split
set laststatus=3
set showcmdloc=statusline
