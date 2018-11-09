if !has("nvim")
  if v:version >= 800 || has("patch-7.4.2111")
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim
  endif
  if &term=~"xterm"
    let &t_Co = 256
    let &t_te.="\e[0 q"
    let &t_ti.="\e[2 q"
    let &t_EI.="\e[2 q"
    let &t_SI.="\e[6 q"
    let &t_SR.="\e[4 q"
  endif
  source ~/.exrc
  if executable("sl")
    cnoremap sl !sl
  endif
else
  silent! source ~/.exrc
endif
syntax enable
augroup CursorLineNumHighlight
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=NONE
  autocmd ColorScheme * highlight CursorLineNr ctermfg=Yellow
  autocmd ColorScheme * highlight LineNr ctermfg=Brown
augroup END
colorscheme industry
filetype plugin indent on
let g:loaded_matchparen=1
let g:python_recommended_style=0
let g:tex_flavor="latex"
noremap Y y$
noremap ; :
noremap : ;
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap < <gv
vnoremap > >gv
if &compatible
  set nocompatible
endif
set autochdir
set autoread
set background=dark
set backspace=indent,eol,start
set nobackup
set belloff=all
set breakindent
set clipboard=unnamed
set cursorline
set expandtab
set fileencodings=ucs-bom,utf-8,default,iso-2022-jp,euc-jp,sjis,cp932,latin1
set helpheight=50
set hidden
set incsearch
set keywordprg=:help
set laststatus=1
set listchars=tab:>-,trail:_
set mouse=h
set shiftround
set showcmd
set smarttab
set softtabstop=-1
set nostartofline
set noswapfile
set title
set ttimeoutlen=0
set noundofile
set virtualedit=block
set whichwrap=b,s,~
set wildmenu
