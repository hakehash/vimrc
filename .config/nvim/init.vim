"See :help nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
augroup RestoreCursor
  autocmd!
  autocmd BufReadPre * autocmd FileType <buffer> ++once
        \ let s:line = line("'\"")
        \ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
        \      && index(['xxd', 'gitrebase'], &filetype) == -1
        \      && !&diff
        \ |   execute "normal! g`\""
        \ | endif
augroup END
set cpoptions+=_
set clipboard=unnamedplus
set helplang=en
set inccommand=split
"set laststatus=3
