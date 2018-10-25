" Vim filetype plugin file
" Language:     LaTeX
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 25 Oct 2018

inoremap <buffer> $ $$<LEFT>
if has('syntax') && has('eval')
  packadd matchit
endif
