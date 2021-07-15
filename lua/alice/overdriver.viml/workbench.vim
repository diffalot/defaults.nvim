"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dev Tools
"
" THINKING: These _if_ distributed some things should remain behind a flag
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* DevSchemesHighlightsListRealOfficial    :so $VIMRUNTIME/syntax/hitest.vim

augroup SchemeDevAutoCommands
    "autocmd! ColorScheme * :SchemesItalicizeComments<CR>
augroup END
command! -nargs=1 DevSchemesWorkbench call s:DevSchemesWorkBenchListener(<f-args>)

"https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nmap <F10> :echo "hi<"
            \ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! SchemesAlicesHighlights()
    " galaxy should show mode
    let g:bg_00='#1f2128'                 "00  Background
    let g:PurpleShadow_08='#6f78a8'       "08  Dark Grey
    let g:GreenSelector_10='#77e55f'      "10  Green
    let g:AquaSpot_14='#33c3c3'           "14  Spot                #363242  mediumaquamarine( #66cdaa )
    let g:FusciaCounterpoint_05='#ef73ee' "05  Counter

    let g:YellowHighlight_11='#efefaa'    "11  Highlight
    let g:PinkShadow_13='#f3c3cf'         "13  Light Grey
    let g:fg_07='#eff5ea'                 "07  Foreground

    "hi Todo              ctermfg=black ctermbg=5 guifg=#12083e guibg=#eeee5e gui=bold,italic cterm=bold,italic

    hi NvimInternalError ctermfg=1 ctermbg=9 guifg=#e7f9f8 guibg=#ff0883
    "hi ColorColumn       ctermfg=6 ctermbg=5 guibg=#ffcdd9
    hi ColorColumn       ctermfg=6 ctermbg=5 guibg=#171a1e

endfunction
