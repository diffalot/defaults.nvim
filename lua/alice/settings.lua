vim.cmd('set termguicolors') --" if you're lying, you'll go blind!!!! (not really, but the
vim.cmd('set nocompatible')
vim.cmd('set hidden')
vim.cmd('set encoding=utf-8')

vim.cmd('filetype plugin on')
vim.cmd('syntax enable')
vim.cmd('set autoindent')

vim.cmd('set mouse=a')

vim.cmd('set incsearch')
vim.cmd('set ignorecase')
-- set smartcase
vim.cmd('set nohlsearch')

vim.cmd('set number')

--  four spaces instead of tabs, for I am no peasant! I own screen real estate.
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=0')
vim.cmd('set expandtab')
vim.cmd('set shiftwidth=4')
vim.cmd('set smarttab')

--  but not always, so here's to you, Python, no matter what shiftwidth or tabstop
--  catches my eye in this crazy word, I'll always make room for you
--  TODO: move to ftplugin file
vim.cmd('autocmd FileType python set breakindentopt=shift:4')

--  no hard breaks, but guides at 80 and 120
vim.cmd('set textwidth=79')
vim.cmd('set wrapmargin=2')

--  set colorcolumn=80
--  TODO: colorbuddy
--  hi ColorColumn guibg=aliceblue " how could I not?

--  TODO:(alice) figure out good settings for markdown lists
vim.cmd('set linebreak')
vim.cmd('set breakindent')
vim.cmd('set smartindent')

vim.cmd('set wrap')
vim.cmd('set list')

--vim.cmd('set formatprg=par\ -p0s0fw79')
--  to use fmt or par from inside Vim:
--  Format at 79 characters wide
--  :%! fmt -w 79
-- 
--  http://www.nicemice.net/par/
--  Format with 2 character Prefix retained (e.g. `# `), 79 characters Wide, no Suffix
--  characters retained (` */`), and optimised to Fit
--  :%! par p2w79s0f
-- 
--  and an equivalent `fmt` at 79 characters wide
--  :%! fmt -w 79

--  let cursor move across line breaks, please
vim.cmd('set whichwrap=b,s,<,>,[,]')

vim.cmd('set scrolloff=2')
vim.cmd('set sidescrolloff=4')

--  Give more space for displaying messages.
vim.cmd('set cmdheight=2')

--  Open new windows to the right and below, it'll be less disorienting
--  On the other hand, if they open above, maybe I'll close them sooner
--  if I they pop up, and I can always use `:below{right} spl{it} {filename}` if I
--  know I want the file to stick around.  Vertical splits opening to the left is
--  a crime.
-- set splitbelow 
vim.cmd('set splitright')

--  I changed my mind
vim.cmd('set foldlevel=3')

--  Do not resize splits when closing one, it is very rude
vim.cmd('set noequalalways')

vim.cmd('set showtabline=0')
vim.cmd('set laststatus=2')

