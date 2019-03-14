" Development Tools

Plug 'terryma/vim-multiple-cursors'
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
Plug 'honza/vim-snippets'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'

"Searchers
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

"---------------------------------------------------------------------- ONE IDE ----------------------------------------------------------------------

"Define delete without yank
nnoremap x "_d
vnoremap x "_d

"Define better toggle insermode to normalmode
inoremap <C-f> <ESC>
vnoremap <C-f> <ESC>
nnoremap <C-f> <ESC>

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
if !&modifiable
	autocmd VimEnter * retab
endif


"does nothing more than copy the indentation from the previous line, when starting a new line.
"set autoindent

set smartindent

" Show line numbers
set number

"Define active mouse
set mouse=a

" Allow insert the only occurrence and preview data from multiples
set completeopt=menu,preview


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

"Fix any backspace problem (usually on windows)
set backspace=indent,eol,start

set autoindent

set encoding=utf-8

ca Ag Ag!
"---------------------------------------------------------------------- PLUGIN gutentags_plus ----------------------------------------------------------------------
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.one-project']

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
"---------------------------------------------------------------------- PLUGIN neosnippet ----------------------------------------------------------------------

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
smap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

"---------------------------------------------------------------------- PLUGIN deoplete ----------------------------------------------------------------------

let g:deoplete#auto_completion_start_length = 2
let g:deoplete#sources#padawan#auto_update = 1
let g:deoplete#enable_refresh_always=1

" Allow insert the only occurrence and preview data from multiples
set completeopt=menu,preview

autocmd VimEnter * call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
	\ 'auto_complete': 1,
    \ 'smart_case': v:true,
    \ })


function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

"---------------------------------------------------------------------- PLUGIN CTRLP ----------------------------------------------------------------------

let g:cctrlp_show_hidden = 1

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

"---------------------------------------------------------------------- PLUGIN GUTENTAGS And Ctags ----------------------------------------------------------------------

let g:gutentags_project_root = ['.one-project']
let g:gutentags_ctags_exclude = ['*.css', '*.html']
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"---------------------------------------------------------------------- PLUGIN NERDTREE ----------------------------------------------------------------------

let g:NERDTreeChDirMode   = 2
let NERDTreeShowBookmarks = 1

"autocmd VimEnter * call NERDTreeAddKeyMap({
\                       'key': '<cr>',
\                       'callback': {-> feedkeys("\<c-d>", 'int')},
\                      })

autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<ENTER>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<CR>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
let NERDTreeShowHidden=1

function! OpenInTab(node)
autocmd VimEnter * node
    call a:node.activate({'reuse': 'all', 'where': 't'})
endfunction

"---------------------------------------------------------------------- PLUGIN NERDTREE TABS ----------------------------------------------------------------------

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let NERDTreeShowHidden=1

"---------------------------------------------------------------------- PLUGIN AIRLINE ----------------------------------------------------------------------

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:nerdtree_tabs_open_on_gui_startup = 1

"If you have installed powerline fonts
let g:airline_powerline_fonts = 1 "Set Arrow in ariline for use powerline fonts

"---------------------------------------------------------------------- PLUGIN color ----------------------------------------------------------------------

autocmd VimEnter * colorscheme atom

"---------------------------------------------------------------------- PLUGIN vim-indent-guides ----------------------------------------------------------------------

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
