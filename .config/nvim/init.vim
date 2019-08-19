" ---------------------------------------------------------------------------- "
"           Syncing NeoVim config (init.vim) with Vim config (.vimrc)          "
" ---------------------------------------------------------------------------- "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

