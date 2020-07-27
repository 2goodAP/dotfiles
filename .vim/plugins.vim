" Automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

let opt_dir = '~/.vim/pack/vim-plug/opt/'

" Begin adding plugins to Vim
call plug#begin('~/.vim/pack/vim-plug/start')

" For plugins loaded optionally
Plug 'joshdick/onedark.vim', {'dir': opt_dir . 'onedark.vim'}

" For plugins loaded at the start
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

" Language-specific plugins
Plug 'editorconfig/editorconfig-vim', {'for': 'dosini'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'freitass/todo.txt-vim', {'for': 'todo'}
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'jvirtanen/vim-octave', {'for': ['octave', 'matlab']}

call plug#end()
