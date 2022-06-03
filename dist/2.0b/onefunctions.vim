if has('win32')
    let g:sep = '\'
else
    let g:sep = '/'
endif

function onefunctions#log(message)
python3 << EOF
from datetime import datetime
import json
# now = datetime.now()
# log = open('./one-log.txt', "a")
# log.write("\n"+ now.strftime("%Y-%m-%d %H:%M:%S") + ' '+ json.dumps(vim.eval('a:message'))+"\n")
# log.close()
EOF
endfunction

function onefunctions#onLoad()
    :exec 'NERDTree '.g:nerdTreeDefaultPath
	if has('nvim')
	    :echo onefunctions#i18n('stealth.inNvim')
	else
	    autocmd VimEnter * setlocal cm=blowfish2
	endif
endfunction

function onefunctions#readIgnore(pathConfig)
    let config = []
    let lines = readfile(a:pathConfig)

    if lines != []
        for line in lines
            :call add(config, line)
        endfor
    endif
    return config
endfunction

function onefunctions#i18n(message)
    let messages = {
        \ 'starting'            : "starting",
        \ 'exit'                : "exit",
        \ 'deploy.plinkNotFound'       : "PLINK not found",
        \ 'deploy.pscpNotFound'        : "PSCP not found",
        \ 'deploy.noMethod'     : "No Method found",
        \ 'saltpasstoenc'       : "Set the salt to this project encryption : ",
        \ 'setpassproj'         : 'Set the password to this project encryption : ',
        \ 'passtoenc'           : 'Password to encryption : ',
        \ 'passfoproj'          : 'password for this project : ',
        \ 'passnotvalid'        : 'password not valid',
        \ 'thisprojdhaconf'     : "this project doesn't have a configuration",
        \ 'decryptSuccess'      : "Decrypted",
        \ 'font-size'           : "Digite a fonte : ",
        \ 'font-non-compatible' : "você não está em uma GUI para mudar a fonte",
        \ 'stealth.inNvim'      : "você está no NeoVim que não é compatível com blowfish",
        \ 'one.select.folder'   : "Select the path for creation : ",
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

    if lines == []
        return {}
    else
        for line in lines
            let config = config . line
        endfor

        exec "return " . substitute(config, "\n", "", "")
    endif
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
