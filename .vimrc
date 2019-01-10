set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'idris-hackers/idris-vim'
Plugin 'tomasr/molokai'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'vimoutliner/vimoutliner'
Plugin 'igankevich/mesonic'
Plugin 'vim-utils/vim-cscope'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" A must for programming "
set smartindent

" Change as required "
set expandtab
set shiftwidth=4
set tabstop=4

let maplocalleader = ";"  " boss.

" For eclim "
"filetype indent on

" Next two for searching "
set ignorecase smartcase hlsearch
" Easy escape sequence "
inoremap jj <Esc>

:nnoremap <Leader>s :SemanticHighlightToggle<cr>

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

" TODO: how to handle this in neovim?
if has('gui_running')
    colorscheme molokai  " When in GUI...
    set guifont=Monospace\ 10
    set nowrap
    set numberwidth=5
    " Show line numbers "
    set number
    autocmd InsertEnter * :set norelativenumber  " when inserting show line number
    autocmd InsertLeave * :set relativenumber    " otherwise show relative numbers
else
    set background=dark
endif
