"-----------------------------------------------------------------------------"
"                          NeoVim config (init.vim)                           "
"-----------------------------------------------------------------------------"

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
let &showbreak = '> '

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

" Auto complete characters
"
" Parenthesis completion
inoremap    (<CR>   (<CR>)<ESC>O

" Brace Completion
inoremap    {<CR>   {<CR>}<ESC>O

" Brackets completion
inoremap    [<CR>   [<CR>]<ESC>O

" Vim tab and split navigation keybindings
"
" Terminal mode
if exists(':tnoremap')
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
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"-------------------------------------------------------------------"
"                          CUSTOM PLUGINS                           "
"-------------------------------------------------------------------"

" Sourcing the plugin manager file
source ~/.config/nvim/plugins.vim

" LightLine Settings
"
let g:lightline = {'colorscheme': 'base16_gruvbox_light_hard'}

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

" IndentLint Settings
"
let g:indentLine_setColors = 1
let g:indentLine_char = '|'

" YouCompleteMe Settings
"
" Look at the Vim syntax files to retrieve language keywords.
let g:ycm_seed_identifiers_with_syntax = 1
" Collect words from tags file
let g:ycm_collect_identifiers_from_tags_files = 1

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" Ale Settings
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
" C - Options for clang-format
let g:ale_c_clangformat_options = '-style=file'
" CPP - Options for clang-format
let g:ale_cpp_clangformat_options = '-i -style=file'

" vim-markdown Settings
"
" Enable strikethroughs using ~~Strike~~
let g:vim_markdown_strikethrough = 1
" Do not require .md extensions for Markdown links (followed using 'ge')
let g:vim_markdown_no_extensions_in_markdown = 1
" Auto-write when following links with 'ge'
let g:vim_markdown_autowrite = 1

" vim-cpp-enhanced-highlight Settings
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

" Python Highlight Settings
let g:python_highlight_all = 1

" Default Sql Type
let g:sql_type_default = 'mysql'

"
" Colorscheme
"
" Automatically update vim colorscheme based on base16-shell theme
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace = 256
    source ~/.vimrc_background
endif
