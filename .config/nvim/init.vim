" Pathogen
" execute pathogen#infect()

" Encoding details
set encoding=utf-8
set fileencoding=utf-8

" Enabling true colors for terminal neovim
set termguicolors

" Remapping the leader to ,
let mapleader = ','

" Auto complete characters
" Brace Completion
inoremap    {      {
inoremap    {}      {}
inoremap    {{       {}<left>
inoremap    {<CR>   {<CR>}<ESC>O

" Square brackets completion
inoremap    [      [
inoremap    []      []
inoremap    [[       []<left>
inoremap    [<CR>   [<CR>]<ESC>O

" Parenthesis Completion
inoremap    (       (
inoremap    ((       ()<LEFT>

" Show syntax groups
nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" lightline config
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['gitbranch', 'readonly', 'filename', 'modified']]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'LightlineGitBranch',
    \   'readonly': 'LightlineReadonly',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \ },
\ }

" Git Branch and symbol
function LightlineGitBranch()
    return exists('*fugitive#head') ? ("\uE0A0 " . fugitive#head()) : ''
endfunction

" For hiding 'RO' in help and plugin buffers
function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
" Ends here

" For trimming file format and encoding in narrow windows
function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
" Ends here

" Lightline separators and supseparators
let g:lightline.separator = {
    \ 'left': '', 'right': ''
\ }

let g:lightline.subseparator = {
    \ 'left': '', 'right': ''
\ }

" Indentation stuff
set listchars=tab:\¦\ 
set list
let g:indentLine_setColors = 1
let g:indentLine_char = '┆'

" Setting auto indentation
filetype plugin indent on

" Using Omni Completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Customizing nvim
"
" Custom comors

" Using vim's package feature to load onedark
packadd! onedark.vim

if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        let s:orange = { "gui": "#F78E49", "cterm": "202", "cterm16" : "13" }
        autocmd ColorScheme * call onedark#set_highlight("cssProp", { "fg": onedark#GetColors().purple })
        " `bg` will not be styled since there is no `bg` setting
        autocmd ColorScheme * call onedark#set_highlight("cssValueNumber", { "fg": onedark#GetColors().green })
        autocmd ColorScheme * call onedark#set_highlight("cssValueLength", { "fg": onedark#GetColors().green })
        autocmd ColorScheme * call onedark#set_highlight("cssUnitDecorators", { "fg": onedark#GetColors().green})

        autocmd ColorScheme * call onedark#set_highlight("jsVariableDef", { "fg": onedark#GetColors().red})
    augroup END
endif

let g:onedark_color_overrides = {
\   "blue": {'gui': '#5DAEF2', 'cterm': '38', 'cterm16': '4'}
\}


let g:onedark_terminal_italics=1
colorscheme onedark


" Highlight search
set hlsearch
set incsearch

" Syntax highlighting
syntax enable

" Show the line number
set number
set relativenumber

" Softwrap
set wrap linebreak nolist
set showbreak=…

" Ignore case
set ignorecase
set smartcase

" Show command
set showcmd

" Arranging the size of a tab character
set tabstop=4 softtabstop=4 shiftwidth=0 expandtab

" Highlighting the current cursor line
set cursorline

" Split manipulation
set splitright
set splitbelow
nnoremap <c-k> <c-w><c-k>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

" vim-javascript stuff
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
