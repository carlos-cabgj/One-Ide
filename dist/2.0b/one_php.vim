" PHP Tools
Plug 'StanAngeloff/php.vim'
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"---------------------------------------------------------------------- PHP ----------------------------------------------------------------------

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
