let g:ignoreFile                 = '.gitignore'
let g:OneIdePathPSCP             = 'C:\workspace\pscp.exe'
let g:OneIdeDeletePathernEncrypt = "~|.swp"
let g:OneIdeVimEspaceRegex       = '~\[|'
let s:passwords                  = {}
let s:cryptWorking               = 0

command! -n=0 -bar OneProjectAddPassword :call one#addPassword()
command! -n=0 -bar OneProjectDecrypt :call one#projectDecrypt()
command! -n=0 -bar OneProjectEncrypt :call one#ProjectEncrypt()

augroup oneenc
    autocmd BufReadPre   * call s:onReadOneIdePre(expand("<amatch>"))
    autocmd BufWritePre  * call s:onSaveOneIdePre(expand("<amatch>"))
    autocmd BufWritePost * call s:onSaveOneIdePos()
    autocmd VimEnter     * setlocal cm=blowfish2
    autocmd VimEnter     * set viminfo=
augroup end

function s:onSaveAutoDeploy(config, fileFull, fileName)

            let pathSearch      = onefunctions#getFileInTree('.one-project')
    if pathSearch != []

        if a:fileFull == ''
            let basePath   = substitute(pathSearch[1], "\\",  "/" , "g")
            let basePath   = substitute(basePath, a:config['autodeploy']["pathLocal"], "", "g")
            let fileServer = basePath.g:sep.expand('%:t')
            let pathLocal  = expand('%:p')
        else
            let fileServer = substitute(a:fileFull, escape(a:config['encryption']['pathDecode'], '\'), "", "g") 
            let pathLocal  = a:fileFull
        endif

        let pathFileServer = a:config['autodeploy']["pathServer"].fileServer

        if has('win32') == 1
            let pathFileServer = substitute(pathFileServer, '\', '/', 'g')
            let pathLocal = substitute(pathLocal, '\', '/', 'g')

            let sftp = a:config['autodeploy']["user"].'@'.a:config['autodeploy']["host"].':'.pathFileServer
            let auth = ' -pw '.a:config['autodeploy']["pass"].' -l '.a:config['autodeploy']["user"]

            :silent exec ":AsyncRun ".g:OneIdePathPSCP." -q -r ".auth." ".pathLocal." ".sftp
            " :echo ":AsyncRun ".g:OneIdePathPSCP." -q -r ".auth." ".pathLocal." ".sftp
        else 
            :echo 'saiu'
            "exec ":AsyncRun sftp ".sftp" <<< $'put ".expand('%:p')."' & yes"
        endif
            :echo '123'
    endif
endfunction

function! s:onReadOneIdePre(file)
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
        let config       = onefunctions#readConfig(pathSearch[0])
        let a:pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
        let ignored      = []

        if a:pathIgnore != []
            let ignored = onefunctions#readIgnore(a:pathIgnore[0])
        endif

        let l:endpath = substitute(expand('%:p'), escape(pathSearch[1], '\'), "", "")

        if onefunctions#regexTestFiles(ignored, l:endpath) == 0
            if has_key(config, 'encryption') == 1 && config['encryption']['status'] == 1
                if has_key(s:passwords, pathSearch[1]) == 0
                    let pass = inputsecret(onefunctions#i18n('setpassproj'))
                    let s:passwords[pathSearch[1]] = pass
                endif
                silent! exec ':set key='.s:passwords[pathSearch[1]]
            endif
        endif
    endif
endfunction

function! one#setpass(path)
    let name = inputsecret(onefunctions#i18n('passtoenc'))
    let s:passwords[a:path] = name
endfunction

function one#addPassword()
    let pathSearch = onefunctions#getFileInTree('.one-project')
    let config = onefunctions#readConfig(pathSearch[0])

    if pathSearch != []
        let pass = inputsecret(onefunctions#i18n('passfoproj'))
        let s:passwords[pathSearch[1]] = pass
    endif
endfunction

function s:onSaveOneIdePre(file)
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
        let config = onefunctions#readConfig(pathSearch[0])
        let file = ''

        if has_key(config, 'encryption') == 1 && config['encryption']['status'] == 1
            let pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
            let ignored      = []
            let pathDecode = config['encryption']['pathDecode']

            if pathIgnore != []
                let ignored = onefunctions#readIgnore(pathIgnore[0])
            endif

            if has_key(s:passwords, pathSearch[1]) == 1 && onefunctions#regexTestFiles(ignored, expand('%:p')) == 0
                if s:cryptWorking == 0
                    :set noswapfile
                    :set nobackup
                    :set nowritebackup
                    :set viminfo=
                    :set key=
                    let l:endpathFolder = substitute(expand('%:p:h').g:sep, escape(pathSearch[1], '\'), "", "")
                    let l:endpath = substitute(expand('%:p'), escape(pathSearch[1], '\'), "", "")
                    if pathDecode != ''
                        if isdirectory(pathDecode.l:endpathFolder) == 0
                            :call mkdir(pathDecode.l:endpathFolder, 'p')
                        endif
                        silent! exec ':w! '.pathDecode.l:endpath
                        let file = pathDecode.l:endpath
                    endif
                    silent! exec ':set key='.s:passwords[pathSearch[1]]
                endif
            endif
        endif
        if has_key(config, 'autodeploy') == 1 && config['autodeploy']['status'] == 1
            :call s:onSaveAutoDeploy(config, file, l:endpath)
        endif
    endif
endfunction

function s:onSaveOneIdePos()

    let pathSearch = onefunctions#getFileInTree('.one-project')

    if pathSearch != []
        let config       = onefunctions#readConfig(pathSearch[0])
        let a:pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
        let ignored      = []

        if a:pathIgnore != []
            let ignored = onefunctions#readIgnore(a:pathIgnore[0])
        endif

        let l:endpath = substitute(expand('%:p'), escape(pathSearch[1], '\'), "", "")

        if onefunctions#regexTestFiles(ignored, l:endpath) == 0
            if has_key(config, 'encryption') == 1 && config['encryption']['status'] == 1
                if has_key(s:passwords, pathSearch[1]) == 1 && s:cryptWorking == 0
                    :set key=
                    :set swapfile
                    :set backup
                    :set writebackup
                    :set viminfo='1000,<9999,s100
                endif
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
        let config       = onefunctions#readConfig(pathSearch[0])

        if has_key(config, 'encryption') == 1 && config['encryption']['status'] == 1
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :call one#setpass(pathSearch[1])
            endif
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :echo onefunctions#i18n('passnotvalid')
            else
                :set noswapfile
                let s:cryptWorking = 1
                for l:node in l:globlist
                    let l:endpath = substitute(l:node, escape(pathSearch[1], '\'), "", "")

                    if filereadable(l:node)
                        if matchstr(l:node, escape(g:OneIdeDeletePathernEncrypt, g:OneIdeVimEspaceRegex)) != ''
                            :call delete(l:node)
                        else
                            if onefunctions#regexTestFiles(ignored, l:node) == 0
                                silent! exec ':set key='.s:passwords[pathSearch[1]]
                                silent! exec ':e '.l:node
                                silent! exec ':set key='.s:passwords[pathSearch[1]]
                                silent! exec ':w!'
                                silent! norm gd
                            endif
                        endif
                        if matchstr(l:node, escape(g:OneIdeDeletePathernEncrypt, g:OneIdeVimEspaceRegex)) != ''
                            :call delete(l:node)
                        endif
                    endif
                endfor
                :set swapfile
            endif
        endif
        let s:cryptWorking = 0
    else
        :echo onefunctions#i18n('thisprojdhaconf')
    endif
endfunction

function one#projectDecrypt()
    let pathSearch = onefunctions#getFileInTree('.one-project')
    if pathSearch != []
        let l:globstring = globpath(pathSearch[1], '**')
        let l:globlist   = split(l:globstring, "\n")
        let s:path       = split(pathSearch[1], g:sep)
        let config       = onefunctions#readConfig(pathSearch[0])
        let a:pathIgnore = onefunctions#getFileInTree(g:ignoreFile)
        let ignored      = []

        if a:pathIgnore != []
            let ignored = onefunctions#readIgnore(a:pathIgnore[0])
        endif

        if config['encryption']['status']
            let pathDecode = config['encryption']['pathDecode']
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :call one#setpass(pathSearch[1])
            endif
            if has_key(s:passwords, pathSearch[1]) == 0 || empty(s:passwords[pathSearch[1]])
                :echo onefunctions#i18n('passnotvalid')
            else
                :call delete(pathDecode, 'rf')
                :call mkdir(pathDecode, 'p')
                :set noswapfile
                let s:cryptWorking = 1
                for l:node in l:globlist
                    let l:endpath = substitute(l:node, escape(pathSearch[1], '\'), "", "")
                    if onefunctions#regexTestFiles(ignored, l:endpath) == 0
                        if filereadable(l:node) == 0 
                            :call mkdir(escape(pathDecode.l:endpath, '\'), 'p')
                        else
                            exec ':set key='.s:passwords[pathSearch[1]]
                            silent! exec ':e '.l:node
                            :set key=
                            silent! exec ':w '.pathDecode.l:endpath
                            norm gd
                        endif
                    endif
                endfor
                :set swapfile
            endif
        endif
        let s:cryptWorking = 0
    else
        :echo onefunctions#i18n('thisprojdhaconf')
    endif
endfunction

