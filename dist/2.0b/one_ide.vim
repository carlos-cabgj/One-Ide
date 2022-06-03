function! s:OIPath(path)
    if has('win32')
      return substitute(a:path, "/",  "\\" , "g")
    else
      return substitute(a:path, "\\",  "/" , "g")
    endif
endfunction

let s:current_file = expand("<sfile>:h")

exec "source " . s:current_file . s:OIPath("/one_plugins.vim")

exec "source " . s:current_file . "/one.vim"
exec "source " . s:current_file . "/one_ide_paths.vim"
exec "source " . s:current_file . "/scripts.vim"
"exec source  . s:current_file . /highlights.vim"


exec "source " . s:current_file . "/colors.vim"
exec "source " . s:current_file . "/one_font.vim"

"At this point do slow actions
"autocmd VimEnter * profile start profile.log
"autocmd VimEnter * profile func *
"autocmd VimEnter * profile file *
"autocmd VimEnter * profile pause
"autocmd VimEnter * noautocmd qall!

autocmd BufEnter * lcd %:p:h

"ONE IDE
command! -n=0 -bar W :w

:set showtabline=2
:set tabline =%4*\ %<%F%*

"Disable menu and toolbar on gvim
if has("gui_running")
    :set guioptions -=m
    :set guioptions -=T
endif

set complete-=t

"Allow change buffer without saving
set hidden

"Define delete without yank
nnoremap x "_dl
vnoremap x "_d

"prevent yank the last copy text
vnoremap p "_s<ESC>p
vnoremap P "_dP

"Define better toggle insermode to normalmode

inoremap <S-Enter> <ESC>
vnoremap <S-Enter> <ESC>
nnoremap <S-Enter> :noh<CR><ESC>

inoremap <C-f> <ESC>
vnoremap <C-f> <ESC>
nnoremap <C-f> :noh<CR><ESC>

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

"Prevent losting indent on new line
nnoremap o ox<BS>
nnoremap O Ox<BS>

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

" autocmd VimEnter * set guioptions -=T " verficar se está no gvim
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-C> "+y

" Fix any backspace problem (usually on windows)
set backspace=indent,eol,start

" Set de dault enconding of vim without change files
set encoding=utf-8

ca Ack Ack!
ca ack Ack!

" Change buffers
map gn :bn<cr>
map gp :bp<cr>

" Close buffers
map gd :Bclose<CR>
map gD :Bclose!<CR>

"Case-insensitive when searching
set ignorecase

"Help ending files lf,crlf,cr
set fileformat=dos

nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <C-Up> :resize -5<CR>
nnoremap <C-Down> :resize +5<CR>

"if filereadable(s:OIPath(s:current_file . "/../../../nerdtree/plugin/NERD_tree.vim"))

"PLUGIN VDEBUG

	let g:vdebug_options = {'ide_key': 'oneide', 'break_on_open': 0, 'server': 'localhost', 'port': '9000'}

"PLUGIN vim-session

	let g:session_autosave = 'yes'
	let g:session_autoload = 'yes'

    "PLUGIN neosnippet

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

"PLUGIN vim-anzu
    " mapping
    nmap n <Plug>(anzu-n-with-echo)
    nmap N <Plug>(anzu-N-with-echo)
    nmap * <Plug>(anzu-star-with-echo)
    nmap # <Plug>(anzu-sharp-with-echo)

    " clear status
    nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

    " statusline
    set statusline=%{anzu#search_status()}

    "PLUGIN deoplete

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_completion_start_length = 2
    let g:deoplete#sources#padawan#auto_update  = 1
	inoremap <expr> <C-n>  deoplete#manual_complete()
    " Allow insert the only occurrence and preview data from multiples
    set completeopt=menu,preview

    autocmd VimEnter * call deoplete#custom#option({
        \ 'auto_complete_delay': 4000,
        \ 'auto_complete': 1,
        \ 'smart_case': v:true,
        \ })

	" Use ALE as completion sources for all code.
	autocmd VimEnter * call deoplete#custom#option('sources', {
	\ '_': ['ale'],
	\})

    function! Multiple_cursors_before()
    	alert(1)
        let b:deoplete_disable_auto_complete = 1
        exec "ALEDisable"
    endfunction

    function! Multiple_cursors_after()
        let b:deoplete_disable_auto_complete = 0
        exec "ALEEnable"
    endfunction

"PLUGIN CTRLP

    " Make Ctrlp workin on current workin directory
    let g:ctrlp_root_markers = ['.git','.one-project','.svn']
        let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_max_files=0
        let g:ctrlp_show_hidden = 1
        let g:ctrlp_lazy_update = 250
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|tmp)$',
      \ 'file': '\v\.(exe|so|dll|swp|zip|exe)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

    nnoremap <leader>ca :CtrlPagLocate
    nnoremap <leader>cp :CtrlPagPrevious<cr>

"PLUGIN ALE

    let g:ale_php_phpcbf_executable    = s:current_file . '/../../etc/vendor/bin/phpcbf' "Code Beautifier and Fixer
    let g:ale_php_phpcs_executable    = s:current_file . '/../../etc/vendor/bin/phpcs' "Detect violations
    "let g:ale_php_phpmd_executable = s:current_file . '/../../etc/vendor/bin/phpmd' "focus on metrics

    let g:ale_php_phpmd_ruleset = 'cleancode,codesize,controversial,design,naming,unusedcode'

    "let g:ale_lint_on_text_changed = 'never'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    let g:ale_php_phpcbf_standard='PSR12'

    let g:ale_fix_on_save = 1
    let g:ale_lint_on_enter = 1
    let g:ale_sign_column_always = 1

    let g:ale_sign_error = '->'
    let g:ale_sign_warning = '-'
    let g:ale_linters = {'php': ['phpcs', 'phpcbf']}

    let g:ale_sign_column_always = 1
    let g:ale_emit_conflict_warnings = 1

    let g:LanguageClient_useVirtualText = 1

    "	let g:php_phpcs_options
    let g:ale_set_highlights = 0
    let g:airline#extensions#ale#enabled = 1

    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 0 "Prevent replace the ack quickfix

    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['eslint'],
    \   'html': ['prettier'],
    \   'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
    \}

    let g:syntastic_check_on_open = 1

"PLUGIN ACK

    let g:ackhighlight = 1
"	let g:ackpreview = 1


"PLUGIN TAGBAR

    nmap <F7> :TagbarToggle<CR>


"PLUGIN GUTENTAGS And Ctags

    "Define always use project root
    let g:gutentags_add_default_project_roots = 1
    let g:gutentags_project_root             = ['.one-project']
    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1

    " let g:gutentags_define_advanced_commands = 1
    map <C-\> :exec(":tag ".expand("<cword>"))<CR>
    " enable gtags module

    let g:gutentags_modules = ['ctags']
    let g:gutentags_auto_add_gtags_cscope = 1
    "Better performace
    let g:gutentags_generate_on_missing = 0
    let g:gutentags_background_update = 0

    let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.json', '*.xml',
                            \ '*.swp','\~$','.un\~$', '*.swo',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']


"PLUGIN NERDTREE

    let g:NERDTreeChDirMode   = 1
    let NERDTreeShowBookmarks = 1
    let NERDTreeShowHidden    = 1
    let NERDTreeIgnore        = ['.swp$','\~$','.un\~$']

"PLUGIN AIRLINE

"    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:nerdtree_tabs_open_on_gui_startup    = 0
    "If you have installed powerline fonts
    let g:airline_powerline_fonts              = 0 "Set Arrow in ariline for use powerline fonts
    let g:airline#extensions#tabline#enabled   = 0

"PLUGIN color

	autocmd VimEnter * colorscheme atom
	autocmd VimEnter * hi Cursor guifg=white guibg=orange

"PLUGIN vim-indent-guides

    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level           = 1
    let g:indent_guides_guide_size            = 1
"endif
"
if (index(One_Ide_options, 'php') >= 0)
	exec "source " . s:current_file . s:OIPath("/one_php.vim")
endif

if (index(One_Ide_options, 'js') >= 0)
    exec "source " . s:current_file . "/one_javascript.vim"
endif
