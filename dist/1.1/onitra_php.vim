" PHP Tools
Plug 'StanAngeloff/php.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"---------------------------------------------------------------------- ONITRA PHP ----------------------------------------------------------------------

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"---------------------------------------------------------------------- ONITRA NERDTREE-TABS ----------------------------------------------------------------------

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let NERDTreeShowHidden=1

"---------------------------------------------------------------------- ONITRA PHPCD ----------------------------------------------------------------------

let g:phpcd_autoload_path = '~/.vim/plugged/phpcd.vim/vendor/autoload.php'
