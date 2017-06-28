" Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" Use the Dark theme
set background=dark

" Colorscheme see https://github.com/chriskempson/tomorrow-theme
color Tomorrow-Night

" Airline Theme
let g:airline_theme='tomorrow'
set laststatus=2

" Make Vim more useful
set nocompatible

" Change mapleader
let mapleader=","

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Use the OS clipboard by default
set clipboard=unnamed

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" Centralize undo history
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Set encoding
set encoding=utf-8

" Add line numbers
set number
set ruler
set cursorline

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Disable error bells
set noerrorbells

" GUI
set guifont=Inconsolata:h10

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Markdowm highlighting
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" Jenkinsfile highlighting
au BufNewFile,BufFilePre,BufRead Jenkinsfile set filetype=groovy
