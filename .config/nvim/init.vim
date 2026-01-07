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
augroup TermStartInsert
  autocmd!
  autocmd TermOpen * startinsert
augroup END
augroup SearchWrappedIndicator
  autocmd!
  autocmd SearchWrapped * let g:w="W\ "
augroup END
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
set cpoptions+=_
set clipboard=unnamedplus
if has('nvim-0.8.0')
  set cmdheight=0
endif
set helplang=en
set inccommand=split
if has('nvim-0.7.0')
  set laststatus=3
endif
if has('nvim-0.9.0')
  set showcmdloc=statusline
  set statusline=%<%f\ %h%w%m%r\ %{%LastSearchCount()%}%-12.(\ \ %S%)%-14.(%l,%c%V%)\ %P
elseif has('nvim-0.5.0')
  set statusline=%<%f\ %h%w%m%r\ %{%LastSearchCount()%}%-12.(\ \ %)%-14.(%l,%c%V%)\ %P
endif
