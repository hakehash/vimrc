" Vim syntax file
" Language:    TeX
" Maintainer:  hakehash
" URL:         https://github.com/hakehash
" Last change: 1 Jul. 2019

syntax region Comment start="\\begin{comment}\n" end="\n\\end{comment}"
highlight link Comment Comment
