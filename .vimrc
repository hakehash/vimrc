if has('vim_starting') && has('reltime') && !has('win32') "{{{
  augroup VimStart
    autocmd!
    let g:startuptime = reltime()
    autocmd VimEnter * let g:startuptime = reltime(g:startuptime) | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif "}}}
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
    function! g:SL(...)
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
    if !exists(":SL")
      command! -nargs=? SL call SL(<f-args>)
      cnoreabbrev sl SL
    endif
  endif "}}}
  if has('win32') "{{{
    set runtimepath^=$HOME/.vim
    set runtimepath+=$HOME/.vim/after
    let &packpath = &runtimepath
    set t_ut=
  endif "}}}
  source ~/.exrc
  set helplang=ja,en,ru
else
  silent! source ~/.exrc
endif "}}}
if executable('evince') "{{{
  command! Evince !evince %:r.pdf &
endif "}}}
if executable('factor') "{{{
  command! -nargs=1 Pf let @+=substitute(substitute(system('factor',<q-args>),": ","=","")," ","*","g") | echomsg expand(@+)
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
  packadd! killersheep
  let g:changelog_dateformat="%Y-%m-%d" " ~/.vim/ftplugin/changelog.vim
  let g:loaded_matchparen=1
  if has('patch-7.3.32')
    let g:plugin_skk_disable=1
  endif
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
function g:ToggleJcuken() "{{{
  if &keymap!="russian-jcukenwin"
    set keymap=russian-jcukenwin
  else
    set keymap&
  endif
endfunction "}}}
inoremap <C-r> <Esc>:call ToggleJcuken()<CR>a
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
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set concealcursor=
set conceallevel=2
set cpoptions+=n
if has('cryptv')
  if has('patch-7.4.399')
    set cryptmethod=blowfish2
  elseif v:version >= 703
    set cryptmethod=blowfish
  endif
endif
set cursorline
set errorbells
set expandtab
set fileencodings=ucs-bom,utf-8,default,iso-2022-jp,euc-jp,sjis,cp932,latin1
if has('folding')
  set foldmethod=syntax
endif
set helpheight=50
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
if has('linebreak')
  set showbreak=>\ 
endif
set showcmd
set smartcase
set smarttab
set softtabstop=-1
set spelllang=en,cjk
set nostartofline
set noswapfile
set title
set timeoutlen=500                      " $VIMRUNTIME/keymap/korean.vim
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
