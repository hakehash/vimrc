" Vim filetype plugin file
" Language:     LaTeX
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 28 Jun 2019

inoremap <buffer> $ $$<LEFT>
if has('syntax') && has('eval')
  packadd matchit
endif
if !filereadable('Makefile') && executable('ptex2pdf')
  setlocal makeprg=ptex2pdf\ -l\ %
endif

