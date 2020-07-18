" ALE configurations
" Lint files only using specified linters
let b:ale_linters = ['ccls', 'clang', 'clangcheck', 'clangd',
\                    'clangtidy', 'cppcheck', 'cpplint']

" Fix files with 'clang-format'
nnoremap <silent> <M-f> :w<CR> :!clang-format -i -style=file %<CR> :e<CR>
