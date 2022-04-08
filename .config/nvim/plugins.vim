" Automatic installation for vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

let opt_dir = '~/.local/share/nvim/site/pack/vim-plug/opt/'

" Begin adding plugins to Vim
call plug#begin('~/.local/share/nvim/site/pack/vim-plug/start')

" For colorscheme-specific plugins
Plug 'morhetz/gruvbox', {'dir': opt_dir . 'gruvbox'}

" For general purpose plugins
Plug 'tpope/vim-sensible'
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
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'jvirtanen/vim-octave', {'for': 'octave'}

call plug#end()
