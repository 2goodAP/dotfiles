" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Enabling pathogen
execute pathogen#infect()

" Encoding details
set encoding=utf-8
set fileencoding=utf-8

" IndentLine stuff
set listchars=tab:\¦\ 
set list
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'

" OmniCompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Miscellaneous
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
set splitright
set splitbelow


" vim-airline stuff
let g:airline_extensions=[]
let g:airline_theme='molokai'

" Setting auto indentation
filetype plugin indent on

" Enable syntax highlighting
syntax enable

" Enabling true colors for terminal vim
set termguicolors

" Changing the colorscheme
let g:onedark_terminal_italics=1
colorscheme onedark

" Showing line numbers
set number
set relativenumber

" No auto word wrap
set nowrap

" Ignore case
set ignorecase
set smartcase

set incsearch

" Highlihgt search
set hlsearch

set showcmd

" Highlighting the cursor line
set cursorline

" Arranging the size of a tab character
set tabstop=4 softtabstop=4 shiftwidth=0 noexpandtab

" vim-javascript stuff
let g:javascript_plugin_flow = 1
