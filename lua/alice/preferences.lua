--
--
--                         ▒██
--  █████░                 █░
--  █   ▓█                 █
--  █    █  █▒██▒  ███   █████   ███    █▒██▒  ███   █▒██▒   ▓██▒   ███   ▒███▒
--  █   ▓█  ██  █ ▓▓ ▒█    █    ▓▓ ▒█   ██  █ ▓▓ ▒█  █▓ ▒█  ▓█  ▓  ▓▓ ▒█  █▒ ░█
--  █████░  █     █   █    █    █   █   █     █   █  █   █  █░     █   █  █▒░
--  █       █     █████    █    █████   █     █████  █   █  █      █████  ░███▒
--  █       █     █        █    █       █     █      █   █  █░     █         ▒█
--  █       █     ▓▓  █    █    ▓▓  █   █     ▓▓  █  █   █  ▓█  ▓  ▓▓  █  █░ ▒█
--  █       █      ███▒    █     ███▒   █      ███▒  █   █   ▓██▒   ███▒  ▒███▒
--
--
--
--
vim.cmd [[
" from MINIVIMRC

" filetype support
filetype plugin indent on
syntax on

" because it's there
runtime macros/matchit.vim

" various settings
set autoindent
set backspace=indent,eol,start
set complete+=d
set foldlevelstart=999
set foldmethod=indent
set incsearch
set path& | let &path .= "**"
set ruler
set shiftround
]]
---- vim.cmd('set shiftwidth=0')
---- vim.cmd('set wildcharm=<C-z>')
---- ---- set wildmenu
---- vim.cmd('set wildmode=full')

-- compied from init.vim
vim.cmd('set termguicolors')
vim.cmd('set hidden')

--  I like ColorColumns at 80 and 120
vim.cmd('set colorcolumn+=80')
vim.cmd('set colorcolumn+=120')
-- TODO: move to colorbuddy
-- vim.cmd [[hi ColorColumn ctermbg=5 guibg=#8308ff]]

-- wrapping
vim.cmd('set nowrap')
vim.cmd('set whichwrap=b,s,<,>,[,]')

vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=0')
vim.cmd('set expandtab')
vim.cmd('set shiftwidth=4')
vim.cmd('set smarttab')

-- window settings
vim.cmd('set number')

vim.cmd('set scrolloff=2')
vim.cmd('set sidescrolloff=4')

vim.cmd('set winminheight=0')

--  Give more space for displaying messages.
vim.cmd('set cmdheight=2')

--  I changed my mind
vim.cmd('set foldlevel=999')

--  Do not resize splits when closing one, it is very rude
vim.cmd('set noequalalways')

vim.cmd('set showtabline=2')
vim.cmd('set laststatus=2')

-- use primary system clipboard for yanks
vim.o.clipboard = "unnamedplus"

-- TODO: remove before release
vim.cmd('source ~/.config/nvim/lua/alice/schemes.vim')
vim.cmd('source ~/.config/nvim/lua/alice/wildmenu.vim')

-- Testing
vim.cmd('set formatprg=par\\ -p3s0T4w79')
-- TODO: figure out an autocommand/function that will use par and also:
--     - check `comments` and `commentstring` to set p and s
--         - maybe peek at the first line for comment characters or possible coment
--           characters
--         - maybe peek at the whole block for list level indentations
--     - repeat peeks beyone/inside commented areas (between prefix and suffix)
--       to find and preserve list level indents with breakindents
--     - check `shiftwidth` and `tabstop` `no/expandtab` to set T width
--     - check `textwidth` to set w
--     - runs after filetype setups
--     - does not interfere with vim-autocommands plugin
--     - this might as well be my first rust program 😅
--
-- Format with:
--     (p)refix of (2) characters intact (e.g. `# `)
--     no (s)uffix,
--     (j)ustify output
--     (w)idth of (79)
--     expand (T)abs to 4 characters
--
-- NOTE: This will mangle lists, until I figure out how to make
-- par treat them like quotes, which it adds to prefixes based
-- on the presence of specific characters like `>`
--
-- as an alternative to or replacement for (j)ustification, I recommend (f)it,
-- which looks at all the lines of the output before returning it (i.e. after
-- the number of words in the last line has been set) and if any line can be
-- shortened or lengthened to be as close to the same length as possible, it
-- will be.
--
-- to use as a one off from command mode with (f)it instead of (j)ustification:
-- on a visual block:
-- :'<,'>! par -p2s0T4fw79
--
-- or (not recommended) on the whole file
-- :%! par -p2s0T4fw79
--
-- for refernce here's `fmt` at 79 characters wide
-- :'<,'>! fmt -w 79
--
-- Makes a great autocommand:
-- Lua needs to format with 3 prefix characters: '-- '
--     require('alice.utils').define_augroups({
--         _Par_Formatters = {
--             {'FileType', 'lua', 'setlocal formatprg=par\\ -p3s0fw79'},
--             {'FileType', 'git*', 'setlocal formatprg=par\\ -p3s0fw72'},
--         }
--     }
--
-- More info is available at the par site: http://www.nicemice.net/par/
print('loaded Alice preferences')
