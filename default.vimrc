

call plug#begin()

" HTML5, Javascript Tools
Plug 'vitalk/vim-lesscss'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'

" PHP Tools
Plug 'StanAngeloff/php.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Development Tools
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'brooth/far.vim'
Plug 'Valloric/YouCompleteMe'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

"Searchers
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'lokikl/vim-ctrlp-ag'

call plug#end()

#source ~/.vim/onitra.vim
