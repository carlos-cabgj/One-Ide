call plug#begin()

Plug 'carlos-cabgj/One-Ide'
let g:One_Ide_options = ['php', 'js']

if filereadable($HOME . "/.vim/plugged/One-Ide/dist/1.4/one_ide.vim")
    source $HOME/.vim/plugged/One-Ide/dist/1.4/one_ide.vim
endif

call plug#end()
