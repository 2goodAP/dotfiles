command! PackStatus packadd minpac | source ~/.vimrc | call minpac#status()
command! PackClean packadd minpac | source ~/.vimrc | call minpac#clean()
command! PackUpdate packadd minipac | source ~/.vimrc | redraw | call minpac#update('', { 'do': 'call minpac#status()' })

if !exists('*minpac#init')
    finish
endif

call minpac#init()
" Add minpac first
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add onedark colorscheme
call minpac#add('joshdick/onedark.vim', {'type': 'opt'})

" Add other plugins
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-sensible')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('itchyny/lightline.vim')
call minpac#add('Yggdroot/indentLine')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('ycm-core/YouCompleteMe')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('moll/vim-node')
call minpac#add('octol/vim-cpp-enhanced-highlight')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('hdima/python-syntax')
