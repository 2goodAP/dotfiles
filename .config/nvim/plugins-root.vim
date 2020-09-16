" Automatic installation for vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

let opt_dir = '~/.local/share/nvim/site/pack/vim-plug/opt/'

" Begin adding plugins to Vim
call plug#begin('~/.local/share/nvim/site/pack/vim-plug/start')

" For colorscheme-specific plugins
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'

" For general purpose plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe', {
\   'do': './install.py --clangd-completer --go-completer --rust-completer --ts-completer'
\ }

" For language-specific plugins
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'vim-python/python-syntax', {'for': 'python'}

call plug#end()
