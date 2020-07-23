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

" Source .vimrc file if present in surrent directory
set exrc
" Restrict usage of some commands in non-default .vimrc files
set secure

" Using Omni Completion
set omnifunc=syntaxcomplete#Complete

" Encoding details
set encoding=utf-8
set fileencoding=utf-8

" Enabling true colors for terminal neovim
set termguicolors

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
let showbreak = '> '

" Case
set smartcase
set ignorecase

" Show command
set showcmd

" Arranging the size of a tab character
set tabstop=4 shiftwidth=0 expandtab

" Highlighting the current cursor line
set cursorline

" Display column break at 80 characters
set colorcolumn=80

" Split manipulation
set splitright
set splitbelow

" Remapping the leader to ,
let mapleader=','

" Configure path to look for files
let &path.="**,"

" The following line changes all . to / for gf command (and related):
set includeexpr=substitute(v:fname,'\\.','/','g')
" Build command
set makeprg=make

" Sourcing the plugin manager file
source ~/.vim/plugins.vim

" Auto complete characters
" Brace Completion
inoremap    {       {
inoremap    {}      {}
inoremap    {{      {}<Left>
inoremap    {<CR>   {<CR>}<ESC>O

" Square brackets completion
inoremap    [       [
inoremap    []      []
inoremap    [[      []<Left>
inoremap    [<CR>   [<CR>]<ESC>O

" Parenthesis Completion
inoremap    (       (
inoremap    ((      ()<Left>

" Vim tab and split navigation keybindings
" Terminal mode
if exists(':tnoremap')
    " <C-r>bufferNumber like keymapping for terminal mode
    tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    " 'Escaping' to normal mode in terminal mode
    tnoremap    <A-[>   <C-\><C-n>
    " Split navigation
    tnoremap    <C-h>   <C-\><C-n><C-w>h
    tnoremap    <C-l>   <C-\><C-n><C-w>l
    tnoremap    <C-j>   <C-\><C-n><C-w>j
    tnoremap    <C-k>   <C-\><C-n><C-w>k
    " Tab navigation
    tnoremap    <A-l>   <C-\><C-n>gt
    tnoremap    <A-h>   <C-\><C-n>gT
endif
" Normal mode
nnoremap    <C-k>           <C-w>k
nnoremap    <C-j>           <C-w>j
nnoremap    <C-h>           <C-w>h
nnoremap    <C-l>           <C-w>l
" Tab navigation
nnoremap    <A-l>           gt
nnoremap    <A-h>           gT
" Tab jumping
nnoremap    <A-1>           1gt
nnoremap    <A-2>           2gt
nnoremap    <A-3>           3gt
nnoremap    <A-4>           4gt
nnoremap    <A-5>           5gt
nnoremap    <A-6>           6gt
nnoremap    <A-7>           7gt
nnoremap    <A-8>           8gt
nnoremap    <A-9>           9gt
nnoremap    <A-0>           0gt
" Tab moving
nnoremap    <silent><C-A-h> :execute 'silent! tabmove'.(tabpagenr()-2)<CR>
nnoremap    <silent><C-A-l> :execute 'silent! tabmove'.(tabpagenr()+1)<CR>
" Insert mode
inoremap    <C-k>           <ESC><C-w>k
inoremap    <C-j>           <ESC><C-w>j
inoremap    <C-h>           <ESC><C-w>h
inoremap    <C-l>           <ESC><C-w>l
" Tab navigation
inoremap    <A-l>           <ESC>gt
inoremap    <A-h>           <ESC>gT
" Visual mode
vnoremap    <C-k>           <ESC><C-w>k
vnoremap    <C-j>           <ESC><C-w>j
vnoremap    <C-h>           <ESC><C-w>h
vnoremap    <C-l>           <ESC><C-w>l
" Tab navigation
vnoremap    <A-l>           <ESC>gt
vnoremap    <A-h>           <ESC>gT

" Show syntax groups
nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Hide netrw directory listing banner
let g:netrw_banner = 0

" Assigning a fixed virtualenv for nvim
if has('nvim')
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          CUSTOM PLUGINS                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
function! LightlineGitBranch()
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
let g:indentLine_setColors = 1
let g:indentLine_char = '▏'

" YouCompleteMe settings
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" vim-ale
"
let g:ale_sign_error = 'ﱣ'
let g:ale_sign_warning = ''
" Less distracting when opening a new file
let g:ale_lint_on_enter = 0

" Select fixers for C
let g:ale_fixers = {'*': ['trim_whitespace', 'remove_trailing_lines']}
" Fix files on save using fixers
let g:ale_fix_on_save = 1

" Language specific linter variables
" C: Options for clang-format
let g:ale_c_clangformat_options = '-style=file'
" CPP: Options for clang-format
let g:ale_cpp_clangformat_options = '-i -style=file'

" vim-markdown
"
" Enable strikethroughs using ~~Strike~~
let g:vim_markdown_strikethrough = 1
" Do not require .md extensions for Markdown links (followed using 'ge')
let g:vim_markdown_no_extensions_in_markdown = 1
" Auto-write when following links with 'ge'
let g:vim_markdown_autowrite = 1

" vim-cpp-enhanced-highlight options
"
" Enable highlighting class scope
let g:cpp_class_scope_highlight = 1
" Enable highlighting member variables
let g:cpp_member_variable_highlight = 1
" Enable highlighting class names in declarations
let g:cpp_class_decl_highlight = 1
" Enable highlighting template functions (faster implementation)
let g:cpp_experimental_template_highlight = 1
" Enable highlighting the keywords 'concept' and 'requires' as well as
let g:cpp_concepts_highlight = 1
" Highlighting of user defined functions
let g:cpp_no_function_highlight = 0

" Python highlights
let g:python_highlight_all = 1

" Setting default sql type
let g:sql_type_default = 'mysql'

" javascript-libraries-syntax stuff
let g:used_javascript_libs = 'underscore,backbone,react'

" vim-javascript stuff
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" vim-jsx configs
let g:jsx_ext_required = 1

"
" Custom colors
"
" Using vim's package feature to load onedark
packadd! onedark.vim

if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        " `bg` will not be styled since there is no `bg` setting
        " Custom HTML highlights
        autocmd ColorScheme * call onedark#set_highlight("htmlArg", {
                    \   "fg": onedark#GetColors().dark_yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("htmlTag", {
                    \   "fg": onedark#GetColors().cyan
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("htmlEndTag", {
                    \   "fg": onedark#GetColors().cyan
                    \ })

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
        autocmd ColorScheme * call onedark#set_highlight("jsStatement", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsOperatorKeyword", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsConditional", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsRepeat", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsTry", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsCatch", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsImport", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsFrom", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsExport", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsExportDefault", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsStorageClass", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsReturn", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsFunction", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsClassKeyword", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsExtendsKeyword", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsClassMethodType", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsThis", {
                    \   "fg": onedark#GetColors().yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsTemplateBraces", {
                    \   "fg": onedark#GetColors().purple
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsGlobalNodeObjects", {
                    \   "fg": onedark#GetColors().yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsClassDefinition", {
                    \   "fg": onedark#GetColors().yellow
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsFuncArgs", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsObjectProp", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsObjectShorthandProp", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsDestructuringBlock", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsDestructuringAssignment", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsFlowObjectKey", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsModuleKeyword", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("jsObjectColon", {
                    \   "fg": onedark#GetColors().red
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("jsRegexpString", {
                    \   "fg": onedark#GetColors().dark_yellow
                    \ })

        " Custom Python highlights
        autocmd ColorScheme * call onedark#set_highlight("pythonImport", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("pythonStatement", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("pythonConditional", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("pythonRepeat", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("pythonStrInterpRegion", {
                    \   "fg": onedark#GetColors().purple
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("pythonBuiltinObj", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("pythonBuiltinFunc", {
                    \   "fg": onedark#GetColors().yellow
                    \ })

        " Custom C/C++ highlights
        autocmd ColorScheme * call onedark#set_highlight("cInclude", {
                    \   "fg": onedark#GetColors().yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cDefine", {
                    \   "fg": onedark#GetColors().dark_yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cPreCondit", {
                    \   "fg": onedark#GetColors().dark_yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cPreConditMatch", {
                    \   "fg": onedark#GetColors().dark_yellow,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cType", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cStorageClass", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cStructure", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cCustomClassKey", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cConditional", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cLabel", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cRepeat", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cStatement", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cOperator", {
                    \   "fg": onedark#GetColors().purple
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cFormat", {
                    \   "fg": onedark#GetColors().dark_yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cSpecial", {
                    \   "fg": onedark#GetColors().cyan
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cConstant", {
                    \   "fg": onedark#GetColors().dark_yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cUserLabel", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cAnsiFunction", {
                    \   "fg": onedark#GetColors().yellow
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cCustomMemVar", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cCustomClass", {
                    \   "fg": onedark#GetColors().yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cCustomClassName", {
                    \   "fg": onedark#GetColors().yellow
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cppType", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cppStatement", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })

        autocmd ColorScheme * call onedark#set_highlight("cppSTLnamespace", {
                    \   "fg": onedark#GetColors().red
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cppSTLtype", {
                    \   "fg": onedark#GetColors().purple,
                    \   "gui": "italic",
                    \   "cterm": "italic"
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cppSTLconstant", {
                    \   "fg": onedark#GetColors().dark_yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cppSTLfunction", {
                    \   "fg": onedark#GetColors().yellow
                    \ })
        autocmd ColorScheme * call onedark#set_highlight("cppSTLios", {
                    \   "fg": onedark#GetColors().yellow
                    \ })

        " Custom Vim highlights
        autocmd ColorScheme * call onedark#set_highlight("vimFunction", {
                    \   "fg": onedark#GetColors().blue
                    \ })
    augroup END
endif

let g:onedark_color_overrides = {
\   "blue": {'gui': '#5DAEF2', 'cterm': '38', 'cterm16': '4'}
\ }

let g:onedark_terminal_italics = 1
colorscheme onedark
