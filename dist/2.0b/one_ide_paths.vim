if filereadable($HOME . "/.vim/plugged/nerdtree/plugin/NERD_tree.vim")


    let g:ackprg 						 = "ag"
    let g:gutentags_cache_dir 			= '~/.vim/gutentags'
    let g:neosnippet#snippets_directory = '~/.vim/plugged/vim-snippets/snippets/'
    let g:phpcd_autoload_path 		    = 'vendor/autoload.php'
    
    set guifont=Consolas\ Regular\ 12 "set guifont=Consolas:h12 " on Windows
    
    "let g:ackprg 						 = "PATH TO ag.exe"
    "let g:gutentags_cache_dir 			 = 'PATH TO gutentags'
    "let g:gutentags_ctags_executable 	 = 'PATH TO ctags.exe' " ctags.sourceforge.net
    "let g:tagbar_ctags_bin 			 = 'PATH TO ctags.exe'
    "let g:neosnippet#snippets_directory = 'PATH TO /plugged/vim-snippets/snippets'
    "let g:phpcd_autoload_path 		     = 'PATH TO /vendor/autoload.php'
    "let g:workspace_session_name 		 = 'PATH TO Session.vim'
    "let g:workspace_undodir 			 = 'PATH TO undodir'
    "autocmd VimEnter * source   PATH TO Session.vim
    
    autocmd VimEnter * NERDTree /opt/lampp/htdocs/Dropbox/projects

endif
