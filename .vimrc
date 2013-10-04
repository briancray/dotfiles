" ignore vi compatibility
set nocompatible


" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2. open vim and run :BundleInstall
" 3. update with :BundleUpdate

" Temporarily turn off filetype for Vundle
filetype off

" Load Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-git'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-commentary'
Bundle 'henrik/vim-indexed-search'
Bundle 'wookiehangover/jshint.vim'

" Turn back on filetypes
filetype plugin indent on


" UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

" Highlight current line
set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Height of the command bar
set cmdheight=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Moving around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2


" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic


" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

set t_Co=256
set background=dark
" let g:solarized_termcolors=256
colorscheme solarized


" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8 nobomb

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()


" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent stuff
set ai

" Don't wrap lines
set nowrap


" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't redraw while executing macros (good performance config)
set lazyredraw
