let g:ignoreFile = '.gitignore'
let s:passwords = {}

command! -n=0 -bar OneProjectAddPassword :call one#addPassword()
command! -n=0 -bar OneProjectDecrypt :call one#decodeProject()
command! -n=0 -bar OneProjectEncrypt :call one#ProjectEncrypt()
command! -n=0 -bar OneProjectLoad :call one_ide#teste()

augroup oneenc
    autocmd BufReadPre   * call s:onReadOneIdePre(expand("<amatch>"))
    autocmd BufWritePre  * call s:onSaveOneIdePre(expand("<amatch>"))
	autocmd BufWritePost * call s:onSaveOneIdePos()
    autocmd VimEnter     * setlocal cm=blowfish2
augroup end


function! s:onReadOneIdePre(file)
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
		let config     = onefunctions#readConfig(pathSearch[0])
        if config['encryption']['status'] == 1
            if has_key(s:passwords, pathSearch[1]) == 0
                let pass = input('Set the password to this project encryption: ')
                let s:passwords[pathSearch[1]] = pass
            endif
            silent! exec ':set key='.s:passwords[pathSearch[1]]
        endif
    endif
endfunction

function! one#setpass(path)
    let name = input('RETIRAR Password to encryption: ')
    let s:passwords[a:path] = name
endfunction

function one#addPassword()
    let pathSearch = onefunctions#getFileInTree('.one-project')
    let config = onefunctions#readConfig(pathSearch[0])

    if pathSearch != []
        let pass = input('RETIRAR password for this project :')
        let s:passwords[pathSearch[1]] = pass
    endif
endfunction

function s:onSaveOneIdePre(file)
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
        let config = onefunctions#readConfig(pathSearch[0])
        if config['encryption']['status'] == 1
            let pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
            let ignored      = []

            if pathIgnore != []
                let ignored = onefunctions#readIgnore(pathIgnore[0])
            endif

            if has_key(s:passwords, pathSearch[1]) == 1 && onefunctions#regexTestFiles(ignored, a:file) == 0
                :set noswapfile
                :set nobackup
                :set nowritebackup
                :set viminfo=
                :set key=
                    :echo expand('%:p:h')
                    :echo pathSearch[1]
                let l:endpathFolder = substitute(expand('%:p:h'), escape(pathSearch[1], '\'), "", "")
                let l:endpath = substitute(a:file, escape(pathSearch[1], '\'), "", "")
                if config['encryption']['pathDecode'] != ''
                    :echo isdirectory(escape(config['encryption']['pathDecode'], '\').l:endpathFolder)
                    :echo escape(config['encryption']['pathDecode'], '\').l:endpathFolder
                    if isdirectory(escape(config['encryption']['pathDecode'], '\').l:endpathFolder) == 0
                        :call mkdir(escape(config['encryption']['pathDecode'], '\').l:endpathFolder, 'p')
                    endif
                    silent! exec ':w! '.escape(config['encryption']['pathDecode'], '\').l:endpath
                endif
                silent! exec ':set key='.s:passwords[pathSearch[1]]
            endif
        endif
    endif
endfunction

function s:onSaveOneIdePos()
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
        let config = onefunctions#readConfig(pathSearch[0])
        if config['encryption']['status'] == 1
            if has_key(s:passwords, pathSearch[1]) == 1
                :set key=
                :set swapfile
                :set backup
                :set writebackup
                :set viminfo='1000,<9999,s100
            endif
        endif
    endif
endfunction

function one#ProjectEncrypt()
    let pathSearch = onefunctions#getFileInTree('.one-project')
    let a:pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
    let ignored = []

    if a:pathIgnore != []
        let ignored = onefunctions#readIgnore(a:pathIgnore[0])
    endif
    if pathSearch != []

    let l:globstring = globpath(pathSearch[1], '**')
    let l:globlist   = split(l:globstring, "\n")
    let s:path       = split(pathSearch[1], g:sep)
        let a:config = onefunctions#readConfig(pathSearch[0])
        if a:config['encryption']['status']

            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :call one#setpass(pathSearch[1])
            endif
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :echo 'password not valid'
            else
                :set noswapfile
                for l:node in l:globlist
                    let isfile = matchstr(l:node, '[[:print:]]\{0,}\.[[:print:]]\{1,}$')
                    let l:endpath = substitute(l:node, escape(pathSearch[1], '\'), "", "")
                    if empty(isfile) && filereadable(l:node) && onefunctions#regexTestFiles(ignored, l:node) == 0
                        :set key=
                        silent! exec ':e '.l:node
                        silent! exec ':set key='.s:passwords[pathSearch[1]]
                        silent! exec ':w!'
                        norm gd
                    endif
                endfor
                :set noswapfile
            endif
        endif
    else
        :echo "this project doesn't have a configuration"
    endif
endfunction

function one#decodeProject()
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
        let l:globstring = globpath(pathSearch[1], '**')
        let l:globlist   = split(l:globstring, "\n")
        let s:path       = split(pathSearch[1], g:sep)
        let a:config     = onefunctions#readConfig(pathSearch[0])
        let a:pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
        let ignored      = []

        if a:pathIgnore != []
            let ignored = onefunctions#readIgnore(a:pathIgnore[0])
        endif

        if a:config['encryption']['status']
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :call one#setpass(pathSearch[1])
            endif
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :echo 'password not valid'
            else
                :call delete(a:config['encryption']['pathDecode'], 'rf')
                :call mkdir(a:config['encryption']['pathDecode'], 'p')
                :set noswapfile
                for l:node in l:globlist
                    let isfile = matchstr(l:node, '[[:print:]]\{0,}\.[[:print:]]\{1,}$')
                    let l:endpath = substitute(l:node, escape(pathSearch[1], '\'), "", "")

                    if empty(isfile) && onefunctions#regexTestFiles(ignored, l:endpath) == 0
                        :call mkdir(escape(a:config['encryption']['pathDecode'], '\').l:endpath, 'p')
                    else
                        if filereadable(l:node) && onefunctions#regexTestFiles(ignored, l:endpath) == 0
                            :set key=s:passwords[pathSearch[1]]
                            " silent! exec ':e '.l:node
                            exec ':e '.l:node
                            :set key=
                            " silent! exec ':w '.escape(a:config['encryption']['pathDecode'], '\').l:endpath.
                            exec ':w! '.escape(a:config['encryption']['pathDecode'], '\').l:endpath
                            norm gd
                        endif
                    endif
                endfor
                :set swapfile
            endif
        endif
    else
        :echo "this project doesn't have a configuration"
    endif
endfunction
