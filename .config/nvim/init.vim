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
  autocmd VimEnter,VimResume * set guicursor&
  if has('win32')
    autocmd VimLeave,VimSuspend * set guicursor=a:ver25-blinkon500-blinkoff500
  else
    autocmd VimLeave,VimSuspend * set guicursor=a:block-blinkon500-blinkoff500
  endif
augroup END
set cpoptions+=_
set clipboard=unnamedplus
set helplang=en
set inccommand=split
"set laststatus=3
