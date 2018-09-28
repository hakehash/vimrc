if !has("nvim")
  if v:version >= 800 || has("patch-7.4.2111")
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim
  endif
endif
source ~/.exrc
syntax enable
augroup CursorLineNumHighlight
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=NONE
  autocmd ColorScheme * highlight CursorLineNr ctermfg=Yellow
  autocmd ColorScheme * highlight LineNr ctermfg=Brown
augroup END
colorscheme industry
filetype plugin indent on
if has("win32unix")
  let &t_te.="\e[0 q"
  let &t_ti.="\e[1 q"
  let &t_EI.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_SR.="\e[3 q"
endif
let loaded_matchparen=1
noremap Y y$
noremap ; :
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
set autochdir
set backspace=indent,eol,start
set background=dark
set belloff=all
set breakindent
set clipboard=unnamed
if &compatible
  set nocompatible
endif
set cursorline
set expandtab
set incsearch
set keywordprg=:help
set listchars=tab:>-,trail:_
set mouse=h
set shiftround
set showcmd
set smarttab
set softtabstop=-1
set noswapfile
set title
set ttimeoutlen=0
set t_Co=256
set whichwrap=b,s,~
set wildmenu
