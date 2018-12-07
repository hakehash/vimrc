if !has('nvim')
  if v:version >= 800 || has('patch-7.4.2111')
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
  if executable('sl')
    cnoreabbrev sl !sl<CR>
  endif
  source ~/.exrc
else
  silent! source ~/.exrc
endif
if has('syntax')
  syntax enable
  augroup CursorLineNumHighlight
    autocmd!
    autocmd ColorScheme * highlight CursorLine cterm=NONE
    autocmd ColorScheme * highlight CursorLineNr ctermfg=Yellow
    autocmd ColorScheme * highlight LineNr ctermfg=Brown
  augroup END
  colorscheme industry
  filetype plugin indent on
endif
if has('eval')
  let g:loaded_matchparen=1
  let g:python_recommended_style=0  "I redefined indent in my ftplugin
  let g:tex_flavor="latex"
endif
noremap Y y$
noremap ; :
noremap : ;
noremap <F3> n
if exists('*strftime')
  inoremap <expr> <F5> strftime('%-H:%M %Y/%m/%d%n')
endif
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
if has('autochdir')
  set autochdir
endif
set autoread
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
if has('mouse')
  set mouse=h
endif
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
