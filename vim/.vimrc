set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'

Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

set number
set backspace=indent,eol,start
set history=1000
set showmode
set autoread

set hidden

let base16colorspace=256
colorscheme base16-tomorrow
set background=dark
syntax on
set cursorline
set more
set title
set nuw=6

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on


set nowrap
set linebreak

set scrolloff=10
set sidescrolloff=15
set sidescroll=1
set cinkeys-=0#

set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

set laststatus=2
let g:airline_left_sep=""
let g:airline_right_sep=""

cnoreabbrev Undo GundoToggle

let g:gitgutter_enabled=1
let g:gitgutter_signs=0
let g:gitgutter_highlight_lines=1
