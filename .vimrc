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

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if !has('nvim')
    set t_ut=
endif

" Enable basic vim features
filetype plugin on
syntax enable

" Using Omni Completion
set omnifunc=syntaxcomplete#Complete

" Encoding details
set encoding=utf-8
set fileencoding=utf-8

" Enabling true colors for terminal neovim
set termguicolors

" Remapping the leader to ,
let mapleader=','

" Sourcing the plugin manager file
source ~/.vim/plugins.vim

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

" Nvim split manipulation keybindings
" Terminal mode
if exists(':tnoremap')
    " <C-r>bufferNumber like keymapping for terminal mode
    tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    " 'Escaping' to normal mode in terminal mode
    tnoremap    <A-[>   <C-\><C-n>
    " Split manipulation
    tnoremap    <C-h>   <C-\><C-n><C-w>h
    tnoremap    <C-l>   <C-\><C-n><C-w>l
    tnoremap    <C-j>   <C-\><C-n><C-w>j
    tnoremap    <C-k>   <C-\><C-n><C-w>k
endif
" Normal mode
nnoremap    <C-k>   <C-w>k
nnoremap    <C-j>   <C-w>j
nnoremap    <C-h>   <C-w>h
nnoremap    <C-l>   <C-w>l
" Insert mode
inoremap    <C-k>   <ESC><C-w>k
inoremap    <C-j>   <ESC><C-w>j
inoremap    <C-h>   <ESC><C-w>h
inoremap    <C-l>   <ESC><C-w>l
" Visual mode
vnoremap    <C-k>   <ESC><C-w>k
vnoremap    <C-j>   <ESC><C-w>j
vnoremap    <C-h>   <ESC><C-w>h
vnoremap    <C-l>   <ESC><C-w>l

" lightline config
let g:lightline={
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
function! LightlineGitBranch()
    return exists('*fugitive#head') ? ("\uE0A0 " . fugitive#head()) : ''
endfunction

" For hiding 'RO' in help and plugin buffers
function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

let g:unite_force_overwrite_statusline=0
let g:vimfiler_force_overwrite_statusline=0
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
let g:lightline.separator={
    \ 'left': '', 'right': ''
\ }

let g:lightline.subseparator={
    \ 'left': '', 'right': ''
\ }

" Indentation stuff
set listchars=tab:\▏\ 
set list
let g:indentLine_setColors=1
let g:indentLine_char='▏'

" Highlight search
set hlsearch
set incsearch

" Live substitution
if exists('inccommand')
    set inccommand=split
endif

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

" vim-cpp-enhanced-highlight options
" Enable highlighting class scope
let g:cpp_class_scope_highlight=1
" Enable highlighting member variables
let g:cpp_member_variable_highlight=1
" Enable highlighting class names in declarations
let g:cpp_class_decl_highlight=1
" Enable highlighting template functions (faster implementation)
let g:cpp_experimental_template_highlight=1
" Enable highlighting the keywords 'concept' and 'requires' as well as 
" all named requirements (like 'DefaultConstructible') in the standard library
let g:cpp_concepts_highlight=1

" javascript-libraries-syntax stuff
let g:used_javascript_libs = 'underscore,backbone,react'

" Python highlights
let python_highlight_all = 1

" Setting default sql type
let g:sql_type_default='mysql'

" vim-javascript stuff
let g:javascript_plugin_flow=1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required=0

" Custom colors

" Using vim's package feature to load onedark
packadd! onedark.vim

if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        " `bg` will not be styled since there is no `bg` setting
        " Custom CSS highlights
        autocmd ColorScheme * call onedark#set_highlight("cssProp", {
                    \   "fg": onedark#GetColors().purple
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cssValueNumber", {
                    \   "fg": onedark#GetColors().green
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cssValueLength", {
                    \   "fg": onedark#GetColors().green
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cssUnitDecorators", {
                    \   "fg": onedark#GetColors().green
                    \ })

        " Custom JavaScript highlights
        autocmd ColorScheme * call onedark#set_highlight("jsTemplateBraces", {
                    \   "fg": onedark#GetColors().purple
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsGlobalNodeObjects", {
                    \   "fg": onedark#GetColors().yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsClassDefinition", {
                    \   "fg": onedark#GetColors().yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsThis", {
                    \   "fg": onedark#GetColors().yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsFuncArgs", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsObjectProp", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsFlowObjectKey", { 
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsObjectColon", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsRegexpString", {
                    \   "fg": onedark#GetColors().dark_yellow
                    \ })

        " Custom Vim highlights
        autocmd ColorScheme * call onedark#set_highlight("vimFunction", {
                    \   "fg": onedark#GetColors().blue
                    \ })
    augroup END
endif

let g:onedark_color_overrides={
\   "blue": {'gui': '#5DAEF2', 'cterm': '38', 'cterm16': '4'}
\ }

let g:onedark_terminal_italics=1
colorscheme onedark
