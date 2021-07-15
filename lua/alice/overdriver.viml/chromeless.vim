function! ChromelessClear()
    "hi clear Normal
    hi clear StatusLine  
    hi clear StatusLineNC
    hi clear User1       
    hi clear User2       
    hi clear TabLine     
    hi clear TabLineFill 
    hi clear TabLineSel  
    hi clear SignColumn  
    hi clear VertSplit   
endfunction

" don't know if I'll need this clear...
command! -nargs=* SchemesChromelessDark :call SchemesChromelessLight()
function! SchemesChromelessDark()
    call ChromelessClear()
    call SchemesGitSignsDark()
    call SchemesAlicesHighlights()
    call ChromelessDarkColors()
    call Chromeless()
endfunction

command! -nargs=* SchemesChromelessLight :call SchemesChromelessLight()
function! SchemesChromelessLight()
    call ChromelessClear()
    call SchemesGitSignsLight()
    call SchemesAlicesHighlights()
    call ChromelessLightColors()
    call Chromeless()
endfunction

function! ChromelessDarkColors()
    let g:status_bg='#110e20'                          " #1f2128 #1f2128 #221935 #110e20 #1a1632
    let g:status_bg_ansi='0'                           " #cf1330 #ff0883
                                                       " #6f78a8 #4f78a8 #cfb8ca #323e71 #221935 #405878
    let g:status_text_active='#6f78a8'                 " #77e55f #75e55f #10ff84 #77e55f #10ff84 #23512c #8fbc8f
    let g:status_text_active_ansi='6'                  " #33c3c3 #33c3c3 #64f7cf #31c3c3 #64f7cf #66cdaa
                                                       " #321e71 #3c1c80 #5c1c80 #8b2992
    let g:status_highlight='#321e71'                   " #ef73ee #ef73ee #ef73ee
    let g:status_highlight_ansi='6'                    " #efefaa #efefaa #e4b37c #e2b37c #efefaa
                                                       " #f3c3cf #ffcdd9
    let g:status_grey='#6f78a8'                        " #eff5ea
    let g:status_borders='#323e71'
endfunction

function! ChromelessLightColors()
    let g:status_bg='#f5f4f7'         
    let g:status_bg_ansi='0'          

    let g:status_text_active='#321e71'
    let g:status_text_active_ansi='6' 

    let g:status_highlight='#321e71'  
    let g:status_highlight_ansi='6'   

    let g:status_grey='#9f9da2'       
    let g:status_borders='#d8d7da'
endfunction

function! Chromeless()
    exec('hi StatusLine   cterm=none gui=none')
    exec('hi StatusLineNC cterm=none gui=none')
    exec('hi TabLineSel   cterm=none gui=none')
    exec('hi TabLine      cterm=none gui=none')

    exec('hi StatusLine   cterm=bold gui=bold')
    exec('hi StatusLineNC cterm=italic,reverse gui=italic,reverse')

    exec('hi TabLineSel   ctermfg=12 guifg=' . g:status_text_active . ' guibg=' . g:status_highlight . ' cterm=bold,italic,underline gui=bold,italic,underline')
    exec('hi TabLine      ctermfg=7  guifg=' . g:status_borders    . ' guibg=' . g:status_bg . ' cterm=underline             gui=underline')
    exec('hi TabLineFill  ctermbg=0  guibg=' . g:status_bg)

    exec('hi SignColumn   ctermfg=13   guifg=' . g:status_borders)
    exec('hi VertSplit    ctermfg=0    guifg=' . g:status_borders . ' ctermbg=7 guibg=' . g:status_borders . '      cterm=none gui=none')
    exec('hi ColorColumn  ctermfg=none guifg=none ctermbg=7 guibg=' . g:status_borders)

    exec('hi StatusLine   ctermfg=' . g:status_text_active_ansi . ' guifg=' . g:status_text_active  
                    \ . ' ctermbg=' . g:status_highlight_ansi   . ' guibg=' . g:status_highlight   
                    \ . ' cterm=italic gui=italic,reverse')

    exec('hi StatusLineNC ctermfg=' . g:status_text_active_ansi . ' guifg=' . g:status_text_active  
                    \ . ' ctermbg=none                              guibg=none'                      
                    \ . ' cterm=italic gui=italic')

    exec('hi User1        ctermfg=' . g:status_bg_ansi          . ' guifg=' . g:status_bg           . ' ctermbg=' . g:status_text_active_ansi . ' guibg=' . g:status_text_active . ' cterm=bold   gui=bold,reverse')
    exec('hi User2        ctermfg=' . g:status_text_active_ansi . ' guifg=' . g:status_text_active  . ' ctermbg=' . g:status_highlight_ansi   . ' guibg=' . g:status_highlight   . ' cterm=bold,reverse gui=bold')

endfunction

