let s:current_file = expand("<sfile>:h")
" PHP Tools
Plug 'StanAngeloff/php.vim'

" Precisa rodar o composer depois
" $ cd ~/.vim/plugged/phpactor
"$ composer install
Plug 'phpactor/phpactor'

"Autocomplete for deoplete and actor
Plug 'kristijanhusak/deoplete-phpactor'

"Add phpactor in deoplete
autocmd VimEnter * call deoplete#custom#option('sources', {'php' : ['omni', 'phpactor', 'ultisnips', 'buffer']})

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"PLUGIN ALE
"Code Beautifier and Fixer
let g:ale_php_phpcbf_executable    = s:current_file . '/../../etc/vendor/bin/phpcbf'
"Detect violations and standarts
let g:ale_php_phpcs_executable    = s:current_file . '/../../etc/vendor/bin/phpcs'
"Mess detector, focus on metrics
let g:ale_php_phpmd_executable = s:current_file . '/../../etc/vendor/bin/phpmd'

let g:ale_php_phpcbf_standard='PSR12'

"let g:ale_linters['php'] = ['phpcs', 'phpcbf']
let g:ale_linters['php'] = ['phpcs'] " phpmd
let g:ale_fixers['php']  = ['phpcbf', 'remove_trailing_lines', 'trim_whitespace']
