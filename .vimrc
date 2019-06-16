if !has('nvim') "{{{
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
    let &t_vb ="[?5h$<100>[?5l"
  endif
  if executable('sl') && !has('gui_running')
    function! g:SL()
      silent !sl
      redraw!
    endfunction
    command! SL call SL()
    cnoreabbrev sl SL
  endif
  source ~/.exrc
else
  silent! source ~/.exrc
endif "}}}
if has('syntax') "{{{
  syntax enable
  augroup CursorLineNumHighlight
    autocmd!
    autocmd ColorScheme * highlight CursorLine cterm=NONE guibg=NONE
    autocmd ColorScheme * highlight CursorLineNr ctermfg=Yellow
    autocmd ColorScheme * highlight LineNr ctermfg=DarkCyan
  augroup END
  colorscheme industry
  filetype plugin indent on
endif "}}}
if has('eval') "{{{
  let g:changelog_dateformat="%Y-%m-%d"
  let g:loaded_matchparen=1
  let g:python_recommended_style=0 " ~/.vim/ftplugin/python.vim
  let g:tex_flavor="latex"
endif "}}}
"   map {{{
noremap Y y$
noremap ; :
noremap : ;
noremap <F3> n
if exists('*strftime')
  inoremap <expr> <F5> strftime(g:changelog_dateformat)
endif
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap < <gv
vnoremap > >gv
" }}}
" options {{{
if &compatible
  set nocompatible
endif
set ambiwidth=double
if has('autochdir')
  set autochdir
endif
set autoread
set backspace=indent,eol,start
set nobackup
set backupdir-=.
if has('patch-7.4.793')
  set belloff=all
endif
set breakindent
set breakindentopt=min:20,shift:0,sbr
set clipboard=unnamed
set cpoptions=aABceFsn
set cursorline
set expandtab
set fileencodings=ucs-bom,utf-8,default,iso-2022-jp,euc-jp,sjis,cp932,latin1
set helpheight=50
set helplang=en,ja,ru
set hidden
set incsearch
set keywordprg=:help
set laststatus=1
set listchars=tab:>-,trail:_
set matchtime=1
if has('mouse')
  if executable('toolbox')
    set mouse=a
  else
    set mouse=h
  endif
endif
set shiftround
set shortmess+=A
set showbreak=>\ 
set showcmd
set smartcase
set smarttab
set softtabstop=-1
set nostartofline
set noswapfile
set title
set ttimeoutlen=0
if has('persistent_undo')
  set undodir=~/tmp,~/
  set noundofile
endif
set virtualedit=block
set visualbell
set whichwrap=b,s,~
set wildmenu
set writebackup
" }}}
" vim: foldmethod=marker
