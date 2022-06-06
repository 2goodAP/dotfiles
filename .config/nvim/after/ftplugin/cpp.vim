" ALE configurations
"
" Lint files using the specified linters
let b:ale_linters = ['ccls', 'clang', 'clangcheck', 'clangd',
\                    'clangtidy', 'cppcheck', 'cpplint']

" Fix files using the specified fixers
let b:ale_fixers = ['clang-format']

" Options for clang-format
let b:ale_cpp_clangformat_options = '-i -style=file'


" Fix files with 'clang-format'
nnoremap <silent> <A-S-f> :w<CR> :!clang-format -i -style=file %<CR> :e<CR>
inoremap <silent> <A-S-f> <ESC>:w<CR> :!clang-format -i -style=file %<CR> :e<CR>
vnoremap <silent> <A-S-f> <ESC>:w<CR> :!clang-format -i -style=file %<CR> :e<CR>
