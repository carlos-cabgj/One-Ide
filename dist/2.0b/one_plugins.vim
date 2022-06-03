Plug 'carlos-cabgj/one-functions'
Plug 'carlos-cabgj/vim-stealth-mode'
Plug 'carlos-cabgj/autodeploy.vim'
"Plug 'carlos-cabgj/autodeploy.vim', { 'branch': 'dev' }

Plug 'bpstahlman/txtfmt'

"Development Tools
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'connorholyday/vim-snazzy'

"
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"Pack Session
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
"End Pack Session


Plug 'mbbill/undotree'
Plug 'brooth/far.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'

Plug '907th/vim-auto-save'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Plugin for extend % to hmtl tags
Plug 'adelarsq/vim-matchit'

Plug 'w0rp/ale'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'vim-syntastic/syntastic'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asyncrun.vim'
Plug 'vim-vdebug/vdebug', { 'branch': 'master' }

" Tools
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

Plug 'flazz/vim-colorschemes'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
Plug 'osyo-manga/vim-anzu'

"Searchers
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
