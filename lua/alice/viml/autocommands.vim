" TODO: move these to FT plugins
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

" VERIFY: why does this show sn error?? probably something from when it was a
" command, it's a lot easier to manage now that it's a command that calls a
" function
autocmd BufWritePre <buffer> :TrimWhitespace<CR>

"autocmd FileType c,cpp,java,php,markdown,javascript,fish autocmd BufWritePre <buffer> %s/\s\+$//e
