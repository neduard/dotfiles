set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'idris-hackers/idris-vim'
Plugin 'tomasr/molokai'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jaxbot/semantic-highlight.vim'
"Plugin 'vimoutliner/vimoutliner'       "not used
"Plugin 'igankevich/mesonic'            "not used
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'skywind3000/gutentags_plus'
Plugin 'rhysd/vim-clang-format'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" A must for programming "
set smartindent

" Don't define shiftwidth as that is project-dependent.
" (use .editorconfig file for example)
set expandtab
set tabstop=8

let maplocalleader = ";"  " boss.

" For eclim "
"filetype indent on

" Next two for searching "
set ignorecase smartcase hlsearch
" Easy escape sequence "
inoremap jj <Esc>

nnoremap <Leader>ss :SemanticHighlightToggle<cr>
nnoremap mm :make<cr>
nnoremap <Leader>n :NERDTree<cr>


" Set the current directory to match the file you are editing "
set autochdir
" For bash-like autocompletion "
set wildmenu
set wildmode=list:longest,list:full

" While in Insert or Replace ^L should perform movement.
inoremap  <Right>
inoremap  <Left>
" filetype plugin on
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'

" " mark tabs and trails
" autocmd Syntax * syn match ExtraWhitespace /\S\s\+$/
" set listchars=tab:>-,trail:~,extends:>,precedes:<
" set list
"
set laststatus=1
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]                                   " file format
set statusline+=%=%-14.(%l,%c%V%)\ %<%P        " right align offset

" See cscope-options: we should use this perhaps?
set cscopequickfix=

" Configure
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_plus_switch = 1
let g:semanticEnableFileTypes = ['cpp', 'h', 'c']
" let g:gutentags_plus_nomap = 1

" in the same way we have cs ..
cnoreabbrev gs GscopeFind

" TODO: remap vim terminal normal mode to ESC rather than <C-w> R
" TODO: gutentags:
"       1. if there is only one match it should jump to that
"       2. when doing a search it might be easier to:
"          split window with quickfix list
"          selecting one would replace the buffer with selection
"          this avoids having the quickfix show up in an awkward location on
"          the screen;
"          it also avoids when selecting something from the quickfix window,
"          having it replace an existing buffer.

syntax on

if has('gui_running') || has('nvim')
    set mouse=a
    colorscheme molokai  " When in GUI...
    if has('mac')
        let g:macvim_default_touchbar_fullscreen=0
        let g:macvim_default_touchbar_characterpicker=0
        set guifont=Menlo:h10
    else
        set guifont=Monospace\ 10
    endif
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    endif
    set nowrap
    set numberwidth=5
    " Show line numbers "
    set number
    set relativenumber
    autocmd InsertEnter * :set norelativenumber  " when inserting show line number
    autocmd InsertLeave * :set relativenumber    " otherwise show relative numbers
else
    set background=dark
endif
