""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"""  Custom Status Line
"""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from scrooloose's blog post
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" via https://kadekillary.work/post/statusline-vim/

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ',
        \ 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ',
        \ '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ',
        \ 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ',
        \ 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup toggles for the toolbox

let g:ifl_character_info_is_displayed=0

command! InfolinesCharacterInfoToggle :let g:ifl_character_info_is_displayed = !g:ifl_character_info_is_displayed <Bar> :let &stl=&stl

function! InfolinesCharacterInfo() abort
  if g:ifl_character_info_is_displayed == 1
    return "\ %<%LL\ ❪%c,%l❫\ \\∪%B\ "
  else
    return ''
  end
endfunction

let g:ifl_file_info_is_displayed=0

command! InfolinesFileInfoToggle :let g:ifl_file_info_is_displayed = !g:ifl_file_info_is_displayed <Bar> :let &stl=&stl

function! InfolinesFileInfo() abort
  if g:ifl_file_info_is_displayed == 1
    return "❱%<\ %r%h%y\ "
  else
    return ''
  end
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start Puttting the pieces together
" 
" turn off that extra `INSERT` -- at screen bottom
set noshowmode



""" PREPENDED LINES FROM PLUGINS ARRIVE ABOVE THIS LINE
""" Then, in the 
""" Everything from here down, at least a line or two into the funciton is going
""" to be appended to the status line, i.e. don't prepend anyting else to the
""" status line unless you want it to be displayed to the right of anything the
""" plugins add to the line

""" statusline= clears the previous statusline render and sets up a new one
set statusline=
set statusline+=%1*
set statusline+=\ %M
"set statusline+=%<\ %-f
set statusline+=%<\ %{pathshorten(expand('%:f'))}
set statusline+=%=
set statusline+=\ %2*
set statusline+=\ ❰
set statusline+=%{%InfolinesCharacterInfo()%}

" This gets us to the point were the right side of the status line is about to
" be added, so we will add that at the end of the init so any status messages
" can be added by other inits in the main bar, in addition to our 'prepend zone'
" where any messages from any plugins that prepend will appear.

"set statusline+=\ Plugins\ Append\ Lines\ Here

" at the very end of your vim init call the following function, to finish
" setting up the statusline after letting the plugins insert their info
" functions after the previous statusline definitions and before the definitions
" in this function.
" 
" for development just uncomment the line following the funtion to call it
" immediately upon sourcing the file and move the 'Plugins append info here' up
" and down in your appended (+=) status component order.  when you have it in
" the right spot, everything above the dev marking line stays outside the function
" and everything below the marker is place in the function.
"
" The prepended info (^=) area is a little harder to describle because the first
" lines to be prepended (the ones higher in the list that are run first) land
" first so the very last status line we prepend winds up being the first status
" line element displayed (farthest to the left on the statusline)
" 
function! FinishStatusLineConstruction()
    set statusline+=%2*

    " Appended lines will be appended to the end of infolines.vim statusline
    " definitions.  That means that any plugins that append status lines between the
    " initial sourcing of infolines.vim and the sourcing of these lines will fall
    " inbetween the two. Uncomment the 'Plugins\ Append\ Lines\ Here" line, and once you
    " have that in the right spot, you put every appended line above it into
    " statusline.vim.
    set statusline^=❱
    "set statusline^=\ Prepends\ Go\ Here
    "set statusline^=\ ❱
    set statusline^=%{%InfolinesFileInfo()%}
    set statusline^=\ \ %{ModeCurrent()}
    set statusline^=%2*
endfunction
"""  ↡ ↧ ⇂ ⇃ ⇓ ⇟ ⇣ ⇩ ⇊ ⟱ ⤋ ⤈ ⤓ ⥕ ⥙ ⥝ ⥡ ⥥ ⇓ ⇟ ⇣ ⇩ ⇊ ⟱ ⤋ ⤈ ⤓ ⥕ ⥙ ⥝ ⥡ ⥥
call FinishStatusLineConstruction() "☚ ☚ ☚ ☚ ☚ Yeah, COMMENT THIS LINE OUT 
"""  ⇬ ⇭ ⇮ ⇯ ⇈ ⟰ ⤊ ⤉ ⤒ ⥉ ⥔ ⥘ ⥜ ⥠ ⥣ ⍏ ˄☚ ☚ ☚ ☚  Yeah! Outside of Development
""" ↑ ▲ 🠕 🠑 ↟ ↥ ↾ ↿ ⇑ ⇞ ⇡ ⇪ ⇧ ⇫ ⇬ ⇭ ⇮ ⇯ ⇈ ⟰ ⤊ ⤉ ⤒ ⥉ ⥔ ⥘ ⥜ ⥠ ⥣ ⍏ ˄ ˆ ˰ ̑ ̭ ᐃ ᐞ
""" MAKE SURE TO COMMENT THIS LINE OUT AND CALL THE FUNCTION FROM THE END OF
""" YOUR INIT.  THE += lines will append to the statusline on the right side,
""" and the ^= lines will prepend to the farthest left, the last prepended line
""" will be the farthest to the left
