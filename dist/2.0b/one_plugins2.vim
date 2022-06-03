
autocmd BufWritePost  * call oneide#downloadPlugins()

function oneide#downloadPlugins()
let s:savePath = s:current_file . '../../'
echo s:savePath
python3 << EOF
lista = [
    'carlos-cabgj/one-functions'
    'Shougo/neosnippet.vim'
    'Shougo/neosnippet-snippets'
    'honza/vim-snippets'
    'skywind3000/asyncrun.vim'
    {'vim-vdebug/vdebug', { 'branch': 'master' }}
    'scrooloose/nerdtree'
    'vim-airline/vim-airline'
    'flazz/vim-colorschemes'
    {'mg979/vim-visual-multi', {'branch': 'master'}}
    'easymotion/vim-easymotion'
    'osyo-manga/vim-anzu'
    'mileszs/ack.vim'
    'ctrlpvim/ctrlp.vim'
    'carlos-cabgj/vim-stealth-mode'
    'carlos-cabgj/autodeploy.vim'
    'majutsushi/tagbar'
    'tpope/vim-surround'
    'tomtom/tcomment_vim'
    'connorholyday/vim-snazzy'
    'ludovicchabant/vim-gutentags'
    'skywind3000/gutentags_plus'
    'mbbill/undotree'
    'brooth/far.vim'
    'nathanaelkane/vim-indent-guides'
    'godlygeek/tabular'
    '907th/vim-auto-save'
    'Chiel92/vim-autoformat'
    'tpope/vim-fugitive'
    'prettier/vim-prettier'
    'adelarsq/vim-matchit'
    'w0rp/ale'
    'xolox/vim-misc'
    'Shougo/deoplete.nvim'
    'roxma/nvim-yarp'
    'roxma/vim-hug-neovim-rpc'
];
import git

for i in list
    git.Git((vim.eval('s:savePath')).clone("https://github.com/" + i + '.git')
EOF
endfunction
