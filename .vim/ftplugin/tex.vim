" Vim filetype plugin file
" Language:     LaTeX
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 21 Jun 2019

inoremap <buffer> $ $$<LEFT>
if has('syntax') && has('eval')
  packadd matchit
endif
setlocal makeprg=ptex2pdf\ -l\ %
