command! -n=0 -bar FontSize :call s:changeFontSize()

function s:changeFontSize()
    let size = input(onefunctions#i18n('font-size'))
    call AdjustFontSize(size)
endfunction

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minFontSize = 5
let s:maxFontSize = 40

function! AdjustFontSize(amount)
    let fontname = substitute(&guifont, s:pattern, '\1', '')

    if (a:amount >= s:minFontSize) && (a:amount <= s:maxFontSize)
        if has("gui_running")
            let newfont = fontname . a:amount
      	    let &guifont = newfont
      	else
	    :echo onefunctions#i18n('font-non-compatible')
        endif
    endif
endfunction
