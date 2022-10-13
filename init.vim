syntax on

"leader key
let mapleader = " "

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"smart search
set ignorecase
set smartcase
"
""smart wrapping

set formatoptions-=cro
set wrap
set textwidth=79
set formatoptions=qrn1

"search as characters are entered
set incsearch"

"keybindings
""<CR> is a carrige return(?)
"remove highlighting (no highlight is the idea I am going for here)
nnoremap <leader>nh :noh<CR>
""open terminal
nnoremap <leader>t :term<CR>

nnoremap <leader>y "*y
"Put from system clipboard
nnoremap <leader>p "*p
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

nnoremap <leader>sh <Esc>:syntax sync clear<CR> 


if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif


call plug#begin('~/.config/nvim/plugged')

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop'  }

Plug 'pearofducks/ansible-vim'

Plug 'alvan/vim-closetag' " closing tags for html
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {'do': 'npm install --frozen-lockfile --production','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'

Plug 'chikamichi/mediawiki.vim'

Plug 'flazz/vim-colorschemes'

Plug 'https://github.com/nathanaelkane/vim-indent-guides'

Plug 'https://github.com/machakann/vim-highlightedyank'

Plug 'https://github.com/junegunn/goyo.vim'

Plug 'diepm/vim-rest-console'

Plug 'scrooloose/nerdtree'

Plug 'https://github.com/hashivim/vim-terraform.git'

call plug#end()

let g:gruvbox_guisp_fallback = "bg"

"needed for italics, only works in some terminals
let g:gruvbox_italic=1 
""change to the change coloursheme to whaever I prefer at the time 
set background=dark
"not sure if this is needed or not, or even if it works. Might just be default
""iunno lol
set statusline=%F[%L][%{&ff}]%y[%04l,%04v]


"hide the options in gvim
set guioptions=aci

setlocal spell spelllang=en_us
setlocal spell!

let g:netrw_banner = 0

colorscheme gruvbox
" Security options
set nomodeline
"
" " Don't mark word_word as a markdown error
hi link markdownError Normal
"
"
""pymode

" This stops that stupid error window popping up everywhere on every buffer
let g:pymode_lint_cwindow = 0"

" color schemes
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
" colorscheme evening
" open new split panes to right and below
set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <C-b> :Ex<CR>

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L


" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" use <tab> for trigger completion and navigate to the next complete item
 function! s:check_back_space() abort
     let col = col('.') - 1
     return !col || getline('.')[col - 1]  =~ '\s'
 endfunction

 inoremap <silent><expr> <Tab>
             \pumvisible() ? "\<C-n>" :
             \<SID>check_back_space() ? "\<Tab>" :
             \coc#refresh()

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
"  copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
"  Vim jump to the last position when reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set wildmode=longest,list,full
set wildmenu
