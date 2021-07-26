"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme Auto Mods Mods
"
" NOTICE: no more autocommands in here!
"
" TODO: convert autocommands to lua:
" https://www.reddit.com/r/neovim/comments/kcbnxa/in_search_for_better_autocommand_using_lua/
"
" It's important to place override autocommands as early in the vim init as
" possible
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONSIDER: if instead of needing to require multiple overrides at the top of
" the vimrc, Theme Override could keep a ledger that shows you've asked for
" help, then you announce to theme overrider that your overrides are ready...
" I suppose there's no reason to know that you've registered... if overrider
" already has access to the early autocommands, would there be a way to fake a
" fan out event and maintain priority...
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup AlicesSchemes
    "autocmd! ColorScheme tokyonight           :SchemesLighterTextForDarkBackgrounds
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Modifiers
" TODO: convert autocommands to lua:
" https://www.reddit.com/r/neovim/comments/kcbnxa/in_search_for_better_autocommand_using_lua/
" __these are confied to changing one or two properties on a highlight group
" or two__ 
"
" > PLEASE: My wife needs concealed markdown font highlighting of comment
" > areas in neovim through Tree Sitter and, um... Highlights. 
"
" > INFO: if todo-comments can do it :: it can be done
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* SchemesTransapparate        :hi! Normal   ctermbg=NONE guibg=NONE <Bar>
                                             \ :hi! NonText ctermbg=NONE guibg=NONE <Bar>
                                             \ :hi! LineNr  ctermbg=NONE guibg=NONE cterm=italic gui=italic <CR>
command! -nargs=* SchemesItalicizeComments    :hi! Comment cterm=italic gui=italic<CR>
command! -nargs=* SchemesItalicizeCommentsOff :hi! Comment cterm=NONE   gui=NONE<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function Callers
"
" __I still don't really understand why these are necessary...__ are they in
" lua... are they even available in lua yet? 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Check Background Conditional
function! TestScheme()
    if &background ==# 'dark'
        echo "background is dark"
    endif
    if &background ==# 'light'
        echo "background is light"
    endif
endfunction

command! SchemesLighterTextForDarkBackgrounds call SchemesLighterTextForDarkBackgrounds()
function! SchemesLighterTextForDarkBackgrounds()
    :hi Comment guifg=#739b4b "#668a42 "#dbd270
    :hi Normal guifg=#99dde5
endfunction


command! TokyoNight call TokyoNight()
function TokyoNight()
    let g:tokyonight_transparent='false'
    let g:tokyonight_style='night'
    call InfolinesResetDark()
    colorscheme tokyonight
endfunction



command! TokyoTransparentDayText call TokyoTransparentDayText()
function! TokyoTransparentDayText()
    let g:tokyonight_transparent='true'
    let g:tokyonight_style='day'
    InfolinesResetDark
    colorscheme tokyonight
    InfolinesDark
endfunction

