" Vim filetype plugin file
" Language:     html
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 22 Sep 2018

inoremap <buffer> $ $$<LEFT>
if has('syntax') && has('eval')
  packadd matchit
endif
let b:match_words="<begin>:<end>"
