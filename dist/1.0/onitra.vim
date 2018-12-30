" Set Default ONITRA VIM ----------------------------------------------------------------------------------------------------------------------------------

set number
set mouse=a
set tabstop=4
set autoindent
set hlsearch
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

nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

nnoremap <silent> <buffer> <2-leftmouse> :call <SID>NERDTreeCustomOpenInTab()<cr>
noremap <C-Home> :TagbarToggle<CR>

" PLUGIN PHP ----------------------------------------------------------------------------------------------------------------------------------

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" PLUGIN CTRLP ----------------------------------------------------------------------------------------------------------------------------------

let g:cctrlp_show_hidden = 1

nnoremap <c-f> :CtrlPag<cr>
vnoremap <c-f> :CtrlPagVisual<cr>
nnoremap <leader>ca :CtrlPagLocate
nnoremap <leader>cp :CtrlPagPrevious<cr>
let g:ctrlp_ag_ignores = '--ignore .git
    \ --ignore "deps/*"
    \ --ignore "_build/*"
    \ --ignore "node_modules/*"'

" PLUGIN vim-lesscss ----------------------------------------------------------------------------------------------------------------------------------

let g:lesscss_save_to = '../css/'

" PLUGIN ALE ----------------------------------------------------------------------------------------------------------------------------------

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

"PLUGIN TABBAR ----------------------------------------------------------------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger="<F6>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"PLUGIN TABBAR ----------------------------------------------------------------------------------------------------------------------------------

 nmap <F7> :TagbarToggle<CR>
 
" PLUGIN GUTENTAGS ----------------------------------------------------------------------------------------------------------------------------------

let g:gutentags_project_root = ['.git', '.svn', '.root', '.hg', '.project']
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html']

" PLUGIN NERDTREE ----------------------------------------------------------------------------------------------------------------------------------

let g:NERDTreeChDirMode   = 2
let NERDTreeShowBookmarks = 1

autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTreeFromBookmark /opt/lampp/htdocs/Dropbox/projects
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<CR>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })

function! OpenInTab(node)
    call a:node.activate({'reuse': 'all', 'where': 't'})
endfunction

" PLUGIN NERDTREE TABS ----------------------------------------------------------------------------------------------------------------------------------

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let NERDTreeShowHidden=1

" PLUGIN AIRLINE ----------------------------------------------------------------------------------------------------------------------------------

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
 "Add on tab
let g:airline#extensions#tabline#enabled = 1
let g:nerdtree_tabs_open_on_gui_startup = 1

"If you have installed powerline fonts
let g:airline_powerline_fonts = 1 "Set Arrow in ariline for use powerline fonts
"If Not
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" PLUGIN PHPCD ----------------------------------------------------------------------------------------------------------------------------------

let g:phpcd_autoload_path = '~/.vim/plugged/phpcd.vim/vendor/autoload.php'

" PLUGIN color ----------------------------------------------------------------------------------------------------------------------------------
autocmd VimEnter * colorscheme atom

" PLUGIN YCM ----------------------------------------------------------------------------------------------------------------------------------

"Silencia mensagens de erro
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

"necessário para náo conflitar com o tab voltar identacao
let g:ycm_key_list_select_completion  = ['<c-n>']
let g:ycm_key_list_previous_completion  = ['<c-r>']
