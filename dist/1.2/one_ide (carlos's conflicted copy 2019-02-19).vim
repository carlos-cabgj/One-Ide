" Development Tools
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'brooth/far.vim'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

"Searchers
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'lokikl/vim-ctrlp-ag'

"---------------------------------------------------------------------- ONE IDE ----------------------------------------------------------------------
"set guifont=Consolas\ Regular\ 12
set guifont=Consolas:h12

"Define delete without yank

nnoremap x "_d
vnoremap x "_d

"Define better toggle insermode to normalmode
inoremap <C-f> <ESC>

"Define highline on cursor line
:set cursorline

"Define tabs only use spaces
set expandtab

"Define  indenting is 4 spaces
set shiftwidth=4  

" Highlight all search pattern matches
set hlsearch

"value  that will be inserted when the tab key is pressed
set tabstop=4

" refactoy tab to spaces
autocmd VimEnter * retab

"does nothing more than copy the indentation from the previous line, when starting a new line.
"set autoindent

set smartindent

" Show line numbers
set number

"Define active mouse
set mouse=a

set completeopt=noinsert,menuone,noselect

" Indent with tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

"indent a group visual
vmap <Tab> >gv
vmap <S-Tab> <gv

vnoremap < <gv
vnoremap > >gv

autocmd VimEnter * set guioptions -=T

set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-C> "+y

nnoremap <silent> <buffer> <2-leftmouse> :call <SID>NERDTreeCustomOpenInTab()<cr>
noremap <C-Home> :TagbarToggle<CR>

"---------------------------------------------------------------------- PLUGIN deoplete ----------------------------------------------------------------------

autocmd VimEnter * call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })


"---------------------------------------------------------------------- PLUGIN neosnippet -----------------------------------------------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"---------------------------------------------------------------------- PLUGIN CTRLP ----------------------------------------------------------------------

let g:cctrlp_show_hidden = 1

nnoremap <c-f> :CtrlPag<cr>
vnoremap <c-f> :CtrlPagVisual<cr>
nnoremap <leader>ca :CtrlPagLocate
nnoremap <leader>cp :CtrlPagPrevious<cr>
let g:ctrlp_ag_ignores = '--ignore .git
    \ --ignore "deps/*"
    \ --ignore "_build/*"
    \ --ignore "node_modules/*"'

"---------------------------------------------------------------------- PLUGIN ALE ----------------------------------------------------------------------

 let g:ale_linters = {
 \   'javascript': 'all',
 \ 	'php' : 'all',
 \   'html': 'all',
 \	'xhtml' : 'all',
 \	'xml' : 'all'
 \}
 let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

"---------------------------------------------------------------------- PLUGIN TABBAR ----------------------------------------------------------------------

 nmap <F7> :TagbarToggle<CR>
 
"---------------------------------------------------------------------- PLUGIN GUTENTAGS ----------------------------------------------------------------------

let g:gutentags_project_root = ['.git', '.svn', '.root', '.hg', '.project']
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html']

"---------------------------------------------------------------------- PLUGIN NERDTREE ----------------------------------------------------------------------

let g:NERDTreeChDirMode   = 2
let NERDTreeShowBookmarks = 1

autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTreeFromBookmark source /opt/lampp/htdocs/Dropbox/projects
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<CR>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })

function! OpenInTab(node)
    call a:node.activate({'reuse': 'all', 'where': 't'})
endfunction

"---------------------------------------------------------------------- PLUGIN NERDTREE TABS ----------------------------------------------------------------------

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let NERDTreeShowHidden=1

"---------------------------------------------------------------------- PLUGIN AIRLINE ----------------------------------------------------------------------

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"Add on tab
let g:airline#extensions#tabline#enabled = 1
let g:nerdtree_tabs_open_on_gui_startup = 1

"If you have installed powerline fonts
let g:airline_powerline_fonts = 1 "Set Arrow in ariline for use powerline fonts
"If Not
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"---------------------------------------------------------------------- PLUGIN color ----------------------------------------------------------------------
autocmd VimEnter * colorscheme atom

"---------------------------------------------------------------------- PLUGIN Ag.vim ----------------------------------------------------------------------

" let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"

"---------------------------------------------------------------------- PLUGIN vim-indent-guides ----------------------------------------------------------------------

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

