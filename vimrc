" Make Vim more useful
set nocompatible
filetype off

" Change mapleader
let mapleader=","

" Use the OS clipboard by default
set clipboard=unnamed


"  Vundle (vim plugin manager) stuff "
set rtp+=~/.vim/bundle/Vundle.vim

" Automatically setting up vundle "
let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
    let has_vundle=0
endif

" Plugins
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

" Installing plugins the first time, quits when done
if has_vundle == 0
    :silent! PluginInstall
    :qa
endif

" Enable syntax highlighting
filetype plugin indent on
syntax on

" Use the Dark theme
set background=dark

" Colorscheme see https://github.com/chriskempson/tomorrow-theme
color Tomorrow-Night

" Disable error bells
set noerrorbells

" GUIvim
set guifont=Inconsolata:h10

" Add line numbers
set number
set ruler
set cursorline

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

" Allow backspace in insert mode
set backspace=indent,eol,start

" Highlight character on the 120 chars margin
highlight ColorColumn ctermbg=lightblue guibg=lightblue
call matchadd('ColorColumn', '\%121v', 100)

" Airline Theme
let g:airline_theme='tomorrow'
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Gitgutter Settings
set updatetime=250

" Markdowm highlighting
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" Jenkinsfile highlighting
au BufNewFile,BufFilePre,BufRead Jenkinsfile set filetype=groovy
