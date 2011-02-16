" Get out of VI's compatible mode..
set nocompatible

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread
set autowrite

" Mouse mode ALL
set mouse=a

" We dont want no stinking swaps or backups
set nobackup nowb noswapfile

" Allow backspacing over everything
set backspace=indent,eol,start

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Always show status line, even for one window
set laststatus=2

" Don't request terminal version string (for xterm)
set t_RV=

" Use UTF-8 encoding
set encoding=utf-8

" don't blink
set novisualbell

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Based on http://stevelosh.com/blog/2010/09/coming-home-to-vim Set mapleader to ","
let mapleader = ","

" Hidden buffers - i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
set hidden

" Turn syntax highlighting on
syntax on

" Colour settings
set t_Co=256
set background=dark
colorscheme mustang

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" command-line completion operates in an enhanced mode
set wildmenu
set wildmode=list:longest

set showmode

" Indicates a fast terminal connection.  More characters will be sent to the
" screen for redrawing, instead of using insert/delete line commands.
set ttyfast

" Indenting
" replace tab with spaces
set expandtab

" Text width to be 80, and for it to wrap.
set textwidth=80

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Use 4 spaces for (auto)indent
set shiftwidth=4

set smarttab

" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
" CTRL-T and CTRL-D in Insert mode always round the indent to a multiple of 'shiftwidth'
set shiftround

" Copy indent from current line when starting a new line
set autoindent

" Do smart autoindenting when starting a new line.  Works for C-like programs,
" but can also be used for other languages.
set smartindent

" Searching
" fix Vim’s horribly broken default regex “handling” by automatically inserting a \v
nnoremap / /\v
vnoremap / /\v

" make Vim deal with case-sensitive search intelligently
set ignorecase
set smartcase

" Applies substitutions globally on lines. For example,
" instead of :%s/foo/bar/g you just type :%s/foo/bar/
set gdefault

" Enable incremental search
set incsearch

" highlight results of a search
set hlsearch

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Turn on/off search hilight
function ShowHlSearch()
    if &hlsearch
        set nohlsearch
    else
        set hlsearch
    endif
endfunction

map <silent> <leader>h :silent call ShowHlSearch()<CR>

" makes Vim show invisible characters with the same characters
set list
set listchars=tab:▸\ ,eol:¬,trail:-

" Turn on/off tabs
function ShowTabs()
    if &list
        set nolist
    else
        set list
    endif
endfunction

map <silent> <leader>t :silent call ShowTabs()<CR>

" save on losing focus
au FocusLost * :wa

" save changes
map <leader>s :w<CR>

" exit vim without saving any changes
map <leader>q :q!<CR>

" exit vim saving changes
map <leader>w :x<CR>

" switch to upper/lower window quickly
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Jump between buffers
map <leader>n :bn<cr>
map <leader>p :bp<cr>

map <leader>c :Bclose<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete ".l:currentBufNum)
    endif
endfunction

" Turn spelling on
map <F5> :setlocal spell! spelllang=en_gb<cr>

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" HTML Settings
" set 2 tab for html files
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" HTML/XML tag closing macro - C-_ closes nearest open tag
let g:closetag_html_style=1

" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>

:let NERDTreeShowHidden=1
:let NERDTreeQuitOnOpen=1
:let NERDTreeChDirMode=2

" Remove spaces at the end of line
autocmd BufWritePre * :%s/\s\+$//e

" Highlights cursor line
set cursorline

" Adds syntax support for jquery
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
