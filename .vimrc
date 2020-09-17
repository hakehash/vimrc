if !has('nvim') "{{{
  if v:version >= 800 || has('patch-7.4.2111') "{{{
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim
  endif "}}}
  if &term=~"^xterm" "{{{
    let &t_Co = 256
    let &t_te.="\e[0 q"
    let &t_ti.="\e[2 q"
    let &t_EI.="\e[2 q"
    let &t_SI.="\e[6 q"
    let &t_SR.="\e[4 q"
    let &t_vb ="[?5h$<100>[?5l"
  endif "}}}
  if executable('sl') && !has('gui_running') "{{{
    function! g:SL()
      if has('sound')
        "https://upload.wikimedia.org/wikipedia/commons/9/96/D51498.kiteki.2014.ogg
        let s:whistle=expand('~/.vim/D51498.kiteki.2014.ogg')
        "https://voyager.jpl.nasa.gov/assets/audio/golden-record/train.wav
        "let s:whistle=expand('~/.vim/train.wav')
        "http://www.oslivesteam.com/sounds/whistle2.wav
        "let s:whistle=expand('~/.vim/whistle2.wav')
        if filereadable(s:whistle)
          echo sound_playfile(s:whistle)
        endif
      endif
      silent !sl
      redraw!
    endfunction
    command! SL call SL()
    cnoreabbrev sl SL
  endif "}}}
  if has('win32') "{{{
    set t_ut=
    set runtimepath^=$HOME/.vim
    set runtimepath+=$HOME/.vim/after
    let &packpath = &runtimepath
  endif "}}}
  source ~/.exrc
else
  silent! source ~/.exrc
endif "}}}
packadd! killersheep
if executable('evince') "{{{
  command! Evince !evince %:r.pdf &
endif "}}}
if has('syntax') "{{{
  syntax enable
  augroup CursorLineNumHighlight
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight ColorColumn ctermbg=lightgrey
    autocmd ColorScheme * highlight Conceal ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight CursorLine cterm=NONE guibg=NONE
    autocmd ColorScheme * highlight CursorLineNr ctermfg=Yellow guifg=Yellow
    autocmd ColorScheme * highlight Folded ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight LineNr ctermfg=DarkCyan guifg=DarkCyan
  augroup END
  colorscheme industry
  filetype plugin indent on
endif "}}}
if has('eval') "{{{
  let g:changelog_dateformat="%Y-%m-%d" " ~/.vim/ftplugin/changelog.vim
  let g:loaded_matchparen=1
  let g:python_recommended_style=0      " ~/.vim/ftplugin/python.vim
  let g:rst_style=1
  let g:tex_conceal="bdmg"
  let g:tex_flavor="latex"              " ~/.vim/ftplugin/tex.vim
  let g:tex_fold_enabled=1
  let g:vimsyn_folding="af"
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
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
nnoremap <Up> gk
nnoremap <Down> gj
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
vnoremap < <gv
vnoremap > >gv
" }}}
" options {{{
silent! while 0
  set nocompatible
silent! endwhile
set ambiwidth=double
if has('autochdir')
  set autochdir
endif
set autoread
set backspace=indent,eol,start
set nobackup
if has('patch-7.4.793')
  set belloff=all
endif
set breakindent
set breakindentopt=min:20,shift:-2,sbr
set clipboard=unnamed
set concealcursor=
set conceallevel=2
set cpoptions=aABceFsn
set cursorline
set expandtab
set fileencodings=ucs-bom,utf-8,default,iso-2022-jp,euc-jp,sjis,cp932,latin1
if has('folding')
  set foldmethod=syntax
endif
set helpheight=50
set helplang=en,ja,ru
set hidden
set incsearch
set keywordprg=:help
set laststatus=1
set linebreak
set listchars=tab:>-,trail:_
set matchtime=1
if has('mouse')
  if executable('toolbox')
    set mouse=a
  else
    set mouse=ch
  endif
endif
set shiftround
set shortmess+=A
set shortmess-=Ss
set showbreak=>\ 
set showcmd
set smartcase
set smarttab
set softtabstop=-1
set spelllang=en,cjk
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
" vim: foldmethod=marker commentstring="%s nospell
