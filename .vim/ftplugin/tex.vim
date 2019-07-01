" Vim filetype plugin file
" Language:     LaTeX
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 1 Jul 2019

inoremap <buffer> $ $$<LEFT>
if has('syntax') && has('eval')
  packadd matchit
endif
setlocal foldmethod=syntax
setlocal nolinebreak
if !filereadable('Makefile') && executable('ptex2pdf')
  setlocal makeprg=ptex2pdf\ -l\ %
endif

