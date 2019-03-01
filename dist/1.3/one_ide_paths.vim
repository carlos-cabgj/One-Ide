" AG The ag binary path
" let g:ag_prg="PATH\\ag.exe"

" GUTENTAGS directory cache and binary patch
let g:gutentags_cache_dir = '~/.vim/gutentags'
" let g:gutentags_ctags_executable = 'PATH\\ctags.exe'

" NERDTREE Start and initialize the first folder
autocmd VimEnter * NERDTree PATH

" PHPCD the autoload of your project
let g:phpcd_autoload_path = 'vendor/autoload.php'
