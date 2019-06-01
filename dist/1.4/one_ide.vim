function s:OIPath(path)
	if g:One_Ide_os == 'win'
	  return substitute(a:path, "/",  "\\" , "g")
	else
	  return substitute(a:path, "\\",  "/" , "g")
	endif
endfunction

" Development Tools

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'mbbill/undotree'
Plug 'brooth/far.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-fugitive'

"Searchers
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'

function! s:OIPath(path)
	if has('win32')
	  return substitute(a:path, "/",  "\\" , "g")
	else
	  return substitute(a:path, "\\",  "/" , "g")
	endif
endfunction

if (index(One_Ide_options, 'php') >= 0)
    source s:OIPath($HOME/.vim/plugged/One-Ide/dist/1.4/one_php.vim)
endif

if (index(One_Ide_options, 'js') >= 0)
    source s:OIPath($HOME/.vim/plugged/One-Ide/dist/1.4/one_javascript.vim)
endif

source s:OIPath($HOME/.vim/plugged/One-Ide/dist/1.4/one_ide_paths.vim)

"---------------------------------------------------------------------- ONE IDE ----------------------------------------------------------------------

"Allow change buffer without saving
set hidden

"Define delete without yank
nnoremap x "_dl
vnoremap x "_d

"prevent yank the last copy text
vnoremap p "_dP
vnoremap P "_dP

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
set autoindent

" Highlight all search pattern matches
set hlsearch

"value  that will be inserted when the tab key is pressed
set tabstop=4

" refactoy tab to spaces
if !&modifiable
	autocmd VimEnter * retab
endif

"does nothing more than copy the indentation from the previous line, when starting a new line.

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

set encoding=utf-8

ca Ack Ack!

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

if filereadable(s:OIPath($HOME . "/.vim/plugged/nerdtree/plugin/NERD_tree.vim"))

    "---------------------------------------------------------------------- PLUGIN workspace ----------------------------------------------------------------------

    let g:workspace_persist_undo_history = 1

    nnoremap <f4> :ToggleWorkspace<CR>

    let g:workspace_autosave_always = 1
    let g:workspace_autocreate =1

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
    let g:gutentags_define_advanced_commands = 1
    "---------------------------------------------------------------------- PLUGIN NERDTREE ----------------------------------------------------------------------

    let g:NERDTreeChDirMode   = 1
    let NERDTreeShowBookmarks = 1
    let NERDTreeShowHidden=1
    let NERDTreeIgnore	=	['.swp$','\~$','.un\~$']

    "---------------------------------------------------------------------- PLUGIN AIRLINE ----------------------------------------------------------------------

    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:nerdtree_tabs_open_on_gui_startup = 1

    "If you have installed powerline fonts
    let g:airline_powerline_fonts = 1 "Set Arrow in ariline for use powerline fonts
    let g:airline#extensions#tabline#enabled = 1

    "---------------------------------------------------------------------- PLUGIN color ----------------------------------------------------------------------

    autocmd VimEnter * colorscheme atom

    "---------------------------------------------------------------------- PLUGIN vim-indent-guides ----------------------------------------------------------------------

    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 1
    let g:indent_guides_guide_size = 1
endif
