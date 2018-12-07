" Vim filetype plugin file
" Language:     ChangeLog
" Maintainer:   hakehash
" URL:          http://github.com/hakehash/vimrc
" Last Changed: 08 Dec 2018

if getline(1)=~"\.LOG"
  $read !date +\%n\%-H:\%M\ \%Y/\%m/\%d
endif

