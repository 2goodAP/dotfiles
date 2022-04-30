let data_dir = stdpath('data') . '/site'

" Automatic installation of vim-plug
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim' .
    \ ' --create-dirs' .
    \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source stdpath('config') . '/init.vim'
endif

let opt_dir = data_dir . '/pack/vim-plug/opt'

" Begin adding plugins to Vim
call plug#begin(data_dir . '/pack/vim-plug/start')

" For colorscheme-specific plugins
Plug 'morhetz/gruvbox', {'dir': opt_dir . '/gruvbox'}

" For general purpose plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe', {
\   'do': './install.py --ninja --clangd-completer --go-completer --rust-completer --ts-completer'
\ }

" For language-specific plugins
Plug 'editorconfig/editorconfig-vim', {'for': 'dosini'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'vim-python/python-syntax', {'for': 'python'}

call plug#end()
