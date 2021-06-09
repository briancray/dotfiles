" ignore vi compatibility
set nocompatible


" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2. open vim and run :PluginInstall
" 3. update with :PluginUpdate

" Temporarily turn off filetype for Vundle
filetype off

" Load Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Plugins
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tpope/vim-git'
Plugin 'thinca/vim-localrc'
Plugin 'kien/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
" Plugin 'dense-analysis/ale'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'JulesWang/css.vim'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'othree/html5.vim'
" Plugin 'sheerun/vim-json'
" Plugin 'sheerun/yajs.vim'
" Plugin 'tpope/vim-markdown'
" Plugin 'groenewege/vim-less'
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'evanleck/vim-svelte'

" Unload Vundle
call vundle#end()

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
set statusline=
set statusline+=%{fugitive#statusline()}
set statusline+=\ [%F]
set statusline+=\ %y
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
set statusline+=%=
set statusline+=\ %l/%L
set statusline+=\ %P

" Height of the command bar
set cmdheight=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Open up many tabs
set tabpagemax=500


" Moving around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Remap VIM 0 to first non-blank character
map 0 ^


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


" Colors, Syntax and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" set t_Co=256
" set background=dark

" let g:solarized_termcolors=256
" colorscheme solarized

" parse .ract files as coffeescript
" au BufNewFile,BufRead *.ract set filetype=mustache

" Fix for scss
" https://github.com/cakebaker/scss-syntax.vim#function-names-starting-with-a-keyword
autocmd FileType scss set iskeyword+=-

" Force syntax fix when opening
autocmd BufEnter,InsertLeave * :syntax sync fromstart

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

" Quick starts for new files
au BufNewFile *.html 0r ~/.vim/skeleton/skeleton.html

" Better file searching with CtrlP
map ' :CtrlP<enter>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|\.log\|dist\|__sapper__'

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


" ESLINT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_completion_enabled = 0
let g:ale_fixers = { 'javascript': ['eslint'], 'html': ['eslint'] }
let g:ale_javascript_standard_options = '--plugin html'
let g:ale_linter_aliases = {'html': ['javascript']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '➜'

autocmd BufNewFile,BufRead *.svelte set filetype=html

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" VIM-SVELTE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0
