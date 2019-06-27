" Vim filetype plugin file
" Language:     LaTeX
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 27 Jun 2019

inoremap <buffer> $ $$<LEFT>
if has('syntax') && has('eval')
  packadd matchit
endif

if !filereadable('Makefile')
  setlocal makeprg=ptex2pdf\ -l\ %
endif
