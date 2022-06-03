"if filereadable($HOME . "/.vim/plugged/nerdtree/plugin/NERD_tree.vim")

    if has('win32')
        let g:sessionPath                   = 'C:\Users\carlos.guimaraes\vimfiles\session.vim'
        let g:ackprg                        = 'ag -Q'
        let g:gutentags_gtags_dbpath           = 'C:\Users\carlos.guimaraes\gutentags'
	let g:gutentags_cache_dir           = 'C:\Users\carlos.guimaraes\gutentags'

        let g:neosnippet#snippets_directory = 'C:\Users\carlos.guimaraes\vimfiles\plugged\vim-snippets\snippets'

	let g:gutentags_ctags_executable		= 'C:\Users\carlos.guimaraes\vimfiles\ctags58\ctags.exe'
	let g:gutentags_gtags_executable		= 'C:\Users\carlos.guimaraes\vimfiles\gtags\bin\gtags.exe'
	let g:gutentags_gtags_cscope_executable = 'C:\Users\carlos.guimaraes\vimfiles\gtags\bin\gtags-cscope.exe'

        let g:tagbar_ctags_bin              = 'C:\Users\carlos.guimaraes\vimfiles\ctags58\ctags.exe'
        let g:nerdTreeDefaultPath           = 'C:\projects'

	let g:python3_host_prog =	'C:\Users\carlos.guimaraes.CNM\AppData\Local\Programs\Python\Python37-32\python.exe'

        set guifont=Consolas:h11
		autocmd VimEnter * NERDTree C:\projects

    else

        let g:ackprg                        = "ag -Q"
	let g:far#source                    = "ag"
        let g:gutentags_cache_dir           = '~/.vim/gutentags'
        let g:neosnippet#snippets_directory = '~/.vim/plugged/vim-snippets/snippets/'

        " let g:nerdTreeDefaultPath           = '/mnt/hd-grande/projetos-trabalho/'
        let g:nerdTreeDefaultPath           = '/opt/lampp/htdocs/Dropbox/projects/yvy-marã/src'
autocmd VimEnter * NERDTree /opt/lampp/htdocs/Dropbox/projects/yvy-marã
        set guifont=Consolas\ Regular\ 11

    endif
"endif
