command! -n=0 -bar OneProjectLoad :call onefunctions#onLoad()
let g:defaultOneProjectConfig = expand("<sfile>:h") . '/default.one-project'

function! s:dictionaryFlip(dictionary)
    let newDictionary = {}
    for i in dictionary
        let newDictionary[dictionaryFlip[i]] = i
    endfor
    return newDictionary
endfunction

command! -n=0 -bar OneAddProject :call s:addProject()

function s:addProject()
    let path = input(onefunctions#i18n('one.select.folder'), expand('%:p:h'))
    call s:createProjectConfig(path . '/.one-project')
endfunction

function! s:createProjectConfig(file)
python3 << EOF
fileDefaultProjectConfig = open(vim.eval('g:defaultOneProjectConfig'), "r")
f = open(vim.eval('a:file'), "w")
f.write(fileDefaultProjectConfig.read())
f.close()
fileDefaultProjectConfig.close()
EOF
endfun
