" Vim filetype plugin file
" Language:     ChangeLog
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 05 Dec 2018

if getline(1)=~"\.LOG"
  $read !date +\%n\%R\ \%Y/\%m/\%d
endif

