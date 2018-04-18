" Vim syntax file
" Language:    LS-DYNA
" Maintainer:  hakehash
" URL:         http://overpass.dokkoisho.com
" Last change: 17 Apr. 2018

syntax region KeywordCard start="*" end="$"
syntax region Comment start="\$" end="$"

highlight link KeywordCard Statement
highlight link Comment Comment
