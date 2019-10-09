if has('win32')
    let g:sep = '\'
else
    let g:sep = '/'
endif

function onefunctions#readIgnore(pathConfig)
    let config = []
    let lines = readfile(a:pathConfig)
    for line in lines
        :call add(config, line)
    endfor
    return config
endfunction

function onefunctions#i18n(message)
    let messages = {
        \ 'starting'        : "starting",
        \ 'exit'            : "exit",
        \ 'plinkNotFound'   : "PLINK not found",
        \ 'pscpNotFound'    : "PSCP not found",
        \ 'saltpasstoenc'   : "Set the salt to this project encryption     : ",
        \ 'setpassproj'     : 'Set the password to this project encryption : ',
        \ 'passtoenc'       : 'Password to encryption                      : ',
        \ 'passfoproj'      : 'password for this project                   : ',
        \ 'passnotvalid'    : 'password not valid',
        \ 'thisprojdhaconf' : "this project doesn't have a configuration",
        \ 'decryptSuccess'  : "Decrypted",
        \ }

    if has_key(messages, a:message)
        return messages[a:message]
    else
        return 'No Message'
    endif
endfunction

function onefunctions#regexTestFiles(patherns, file)
    let result = 0
    let patherns = a:patherns + [g:ignoreFile, '.one-project']

    for pathern in patherns
        let pathern = escape(substitute(pathern, '*', '[[:print:]]{0,}', "g"), '\~{')
        if matchstr(a:file, pathern) != ''
            let result = 1
        endif
    endfor
    return result
endfunction

function onefunctions#readConfig(pathConfig)
    let config = ""
    let lines = readfile(a:pathConfig)
    for line in lines
        let config = config . line
    endfor

    exec "return " . substitute(config, "\n", "", "")
endfunction

function onefunctions#getFileInTree(file)
    let path       = expand('%:p:h') . g:sep
    let lengthPath = 0
    let pathFile = ''
    let basePath   = ''

    while path != '' && strlen(path) != lengthPath
        let file = path . a:file
        if filereadable(file)
            let pathFile = file
            let basePath = path
            break
        endif
        let lengthPath = strlen(path)
        let path = substitute(path, escape('[^'.g:sep.']+'.g:sep.'?$', '+\?~'), '', '')
    endwhile

    if pathFile != ""
        return [pathFile, basePath]
    else
        return []
    endif
endfunction
