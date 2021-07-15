"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Tab Directory to File Location
command! TCDtoThisFileThenGitRoot :tcd %:p:h | cd `git rev-parse --show-toplevel`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure the file you're editing is has all the *unix trimmings like proper EOLs

command! MakeUnixFileformat :edit ++ff=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syncronize Cronofiles

command! CronofilerSync !fish -c "cronofiler $HOME/cronofiles/ > /dev/null"<CR>
command! WhatTheShell !fish -c "echo $SHELL"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I'm gonna cheat and install this thing:
" FZF (the best search menu I've found :)
" brew install fsf ag ripgrep perl git-delta

" nmap <Leader>l <Esc>:Lines<CR>
" nmap <Leader>f <Esc>:Files<CR>
" nmap <Leader>b <Esc>:Buffers<CR>
" nmap <Leader>fc <Esc>:CocFzfList<CR>
" nmap <Leader>fd <Esc>:CocFzfListResume<CR>
" nmap <Leader>fe <Esc>:CocCommand explorer<CR>
"
" nnoremap <silent> <Leader>cc       :<C-u>CocFzfList commands<CR>
" nnoremap <silent> <Leader>ce       :<C-u>CocFzfList extensions<CR>

" FZF
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" Plug 'antoinemadec/coc-fzf'
" " don't search .git or node_modules by default
" let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude node_modules'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: move these to nnn/init.lua
" https://github.com/mcchrish/nnn.vim
"Plug 'mcchrish/nnn.vim'

" Disable default mappings
let g:nnn#set_default_mappings = 0

" Start n³ in the current file's directory
nnoremap \n :NnnPicker %:p:h<CR>
" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.4, 'top': '16%', 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<C-t>': 'tab split',
      \ '<C-s>': 'split',
      \ '<C-v>': 'vsplit' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: move these to colorscheme.lua
let g:neodark#use_256color=1
let g:neodark#background='#202020'
" handled in auto functions
" let g:neodark#terminal_transparent=1
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
"let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
let g:one_allow_italics=1
let g:material_terminal_italics=1

let g:srcery_bold=1
" Enables bold text.
" Default: 1
"
let g:srcery_italic=1
" Enables italic text.
" Default: gui 1, term 0
"
let g:srcery_underline=1
" Enables underlined text.
" Default: 1
"
let g:srcery_undercurl=1
" Enables undercurled text.
" Default: 1
"
let g:srcery_inverse=1
" Enable or disable inverse highlighting (foreground becomes background, vice versa). This is used for visual selection, search highlights and some other things.
" Srcery will fall back to other methods of highlighting if this is disabled.
" Default: 1
"
let g:srcery_inverse_matches=1
" Highlight search matches using inverse colors.
" Default: 0
"
let g:srcery_inverse_match_paren=1
" When enabled will highlight matching delimiters using inverse colors.
" (:DoMatchParen) Works best with Rainbow parenthesis.
" Default: 0
"
let g:srcery_dim_lisp_paren=0
" Dims lisp dialects delimiters to a fairly dark gray (xgray5 specifically).
" Default: 0
"
let g:srcery_bg_passthrougcope=0
" Lets the terminal control the background color in Vim by setting the
" background to NONE.  A possible use case for this could be you want to
" manipulate the background color in the terminal, and let the results bubble up
" to Vim, like this.  This is a bit of an experimental option, and can cause
" issues in certain terminals.
" Default: 0
"
let g:srcery_guisp_fallback=0
" Sets up alternate highlighting for colored underline/undercurl. Some
" environments are unable to color underline, so this setting will set either
" the background or foreground to whatever color the underline is supposed to
" be.
" This comes in handy if colored underline doesn't work, or underline is
" disabled entirely.
" Default: 'NONE'
" Possible Values: 'fg', 'bg'
"
let g:srcery_italic_types=1
" Italicize types if italic is enabled.
" Default: 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show/hide specialcharacters  ➤ ➫˱⟵⇠⇤⇤¬➧»¶⬃✧⇿˱⇿⇆⬋⤶↵⟂‹◡
" Quick controls over displaying special characters
" tab:»\, eol:¶\,nbsp:¬\,trail:-
"
" they even were, and the problem I was trying to solve, ^^^^^ in the status
" bar was actually caused by having identical active and inactive styling on
" the StatusLine and StatusLineNC highlights, not gonna worry about them, I
" want to be able to turn on end of line whenever.
" stl:\ ,stlnc:\  , ta
" stl: \ ,stlnc: \  ,
set list listchars=tab:➢\ ,trail:‹,nbsp:⇿
command! -nargs=* ShowSpecialCharacters :set list listchars=tab:➫\ ,eol:↲,nbsp:⇋,trail:⟵
command! -nargs=* HideSpecialCharacters :set list listchars=tab:➢\ ,nbsp:⇿,trail:‹

"							               

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: auto trim on file save, then turn off that stupid highlighting
" Manually Trimming whitespace

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Regex Highlight Trailing Whitespace

" Replace with the following and resource if you must flee
"autocmd BufWinEnter * match ws /\s\t\t\t\t\+$/

"hi ws ctermbg=red guibg=#ff0883
"match ws /\s\+$/
"autocmd BufWinEnter * match ws /\s\+$/
