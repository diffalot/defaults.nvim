--
--                           ██          ██   ██         ██
--                          ░░          ░░   ░██        ░██
--                           ██ ███████  ██ ██████      ░██ ██  ███   █████
--                          ░██░░██░░░██░██░░░██░       ░██░██ ░░██  ░░░░░██
--                          ░██ ░██  ░██░██  ░██        ░██░██  ░██  ███████
--                          ░██ ░██  ░██░██  ░██   ██   ░██░██  ░██ ██░░░░██
--                          ░██ ███  ░██░██  ███  ░░█   ███░░████░█░░████████
--                          ░░ ░░░   ░░ ░░  ░░░    ░   ░░░  ░░░░░░  ░░░░░░░░
--
--                                       ▄▀▄ █▀▄ ▀█▀░█▀▀░█▀▀░█▀█░█  ░█▀█ ▀█▀
--                                      ░█▀▀░█░█ ░█ ░█▀▀░█▀▀░█▀█░█  ░█░█ ░█
--                                      ░░▀ ░▀▀ ░▀▀▀░▀  ░▀  ░▀░▀░▀▀▀░▀▀▀ ░▀
--
--
--                                    # Neovim 0.5+ `init.lua` Configuration
--                                   "Alice Davis" <alice@gigantic.computer>
--                                    July 19, 2021, Tenderloin District, SF
--
--▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

vim.cmd [[
if &shell =~# 'fish$'
    let $SHELL='/bin/zsh'
    set shell=/bin/zsh
endif
]]

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
    [[
    augroup Packer
        autocmd!
        autocmd BufWritePost init.lua PackerCompile
    augroup end
    ]],
    false
)

-- TODO: figure out how to do treesitter selections and motions
-- TODO: use a list of buffers associated with a tab rather than CWD buffers
-- TODO: when selecting from "all buffers" switch to containing tab then open buffer
-- - setup fish shell format and linting
-- - lua formatting & linting
-- - add nvim-dap debugging
-- - vim plugin development
--   - list tabpage buffers in telescope
--   - rename tabs
--   - https://github.com/vim-jp/vital.vim
-- - https://github.com/tpope/vim-abolish
-- - switch to lualine?
-- - use themis for testing?
-- - check this out when you need a repl not provided by codi https://github.com/hkupty/iron.nvim
-- - see what setting is needed to turn of conceal of `markdown` syntax for git messages and emails
-- - checkout vmux for single nvim per tmux session https://github.com/jceb/vmux
-- - this is probably way better, but nvr seem to be due for a round of improvements according to the issues: https://github.com/carlocab/tmux-nvr
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager
    use 'rhysd/git-messenger.vim' -- display git commit message for current line
    use 'lambdalisue/gina.vim' -- minimal async git client
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use { 'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons' } -- diagnostic quick list for whole workspace
    use { "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim" }
    use 'ludovicchabant/vim-gutentags' -- Gutentags - https://github.com/ludovicchabant/vim-gutentags
    use 'skywind3000/gutentags_plus' -- gtags for Gutentags
    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
    use 'folke/tokyonight.nvim' -- Ocean/Blue Theme with Treesitter Highlighting for neovim >= 0.5
    use 'Shatur/neovim-ayu' -- Black/White LSP and TS colorscheme in lua
    use 'marko-cerovac/material.nvim' -- Black/White LSP and TS Colorscheme
    use 'itchyny/lightline.vim' -- Fancier statusline
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'kabouzeid/nvim-lspinstall' -- add LspInstall <server> command
    use 'onsails/lspkind-nvim' -- provides default icons for types of completion
    use 'yamatsum/nvim-nonicons' -- more icons in a font
    use 'kosayoda/nvim-lightbulb' -- display lightbulb in gutter when lsp code actions are available
    use 'nvim-lua/lsp-status.nvim' -- statusline info for lsp client
    use 'hrsh7th/nvim-compe' -- Autocompletion plugin
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    -- Lua Development
    use 'euclidianAce/BetterLua.vim' -- lua highlighting
    use 'rafcamlet/nvim-luapad' -- lua REPL
    use 'milisims/nvim-luaref' -- lua 5.1 docs
    -- SpaceEmacs Style Keybindings Help
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- Fern File Tree
    use { 'lambdalisue/fern.vim',
        requires = { 'antoinemadec/FixCursorHold.nvim' } }
    use 'lambdalisue/fern-hijack.vim'
    use { 'lambdalisue/fern-renderer-nerdfont.vim',
        requires = { 'lambdalisue/nerdfont.vim' } }
    use 'lambdalisue/fern-git-status.vim'
    -- personal plugins
    use 'inkch/vim-fish'
    use 'glepnir/dashboard-nvim'
    -- tab management
    use 'gcmt/taboo.vim'
    use 'airblade/vim-rooter'
    -- prose plugins
    use 'plasticboy/vim-markdown'
    use 'godlygeek/tabular'
    use 'junegunn/vim-easy-align'
    use 'preservim/vim-lexical'
    use { 'preservim/vim-pencil',
        requires = {
            'preservim/vim-wordy',
            'preservim/vim-litecorrect',
            'kana/vim-textobj-user',
            'preservim/vim-textobj-quote',
            'preservim/vim-textobj-sentence',
            'dbmrq/vim-ditto',
        }
    }
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    -- theme development
    use 'norcalli/nvim-colorizer.lua'
    -- terminals
    use 'Lenovsky/nuake'
    use 'numToStr/FTerm.nvim'
    -- REPLs
    use 'metakirby5/codi.vim'
end)

-- nuake dropdown terminal
vim.g.nuake_position = 'top'     -- (default 'bottom')	Set the Nuake position to 'bottom', 'right', 'top' or 'left'.
vim.g.nuake_size     = 0.35      -- (default 0.25)	    Set the Nuake size in percent.
vim.g.nuake_per_tab  = true      -- (default 0)

-- floating terminal
require('FTerm').setup({
    cmd = "cd ~;  tmux new-session -A -s floating",
    dimensions  = {
        height = 0.4,
        width = 0.56,
        x = 1.3,
        y = 0.00
    },
    border = 'single' -- or 'double'
})
-- map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- Codi REPLs
vim.g['codi#rightsplit'] = false
vim.g['codi#rightalign'] = false
vim.g['codi#virtual_text_prefix'] = '✶ ❱ '

-- vim-lightbulb (watch for lsp code actions)
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- trouble
require("trouble").setup({
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 15, -- height of the trouble list when position is top or bottom
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
})
require("which-key").register({
    ['~'] = { "<cmd>Nuake<CR>", "Terminal for Tab" },
    ['`'] = { "<cmd>lua require('FTerm').toggle()<CR>", "Floating Terminal" },
    x     = {
        name = 'Trouble Diagnostics',
        x    = { "<cmd>TroubleToggle<CR>",                             "Toggle Trouble" },
        w    = { "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>",   "Workspace Trouble" },
        d    = { "<cmd>TroubleToggle lsp_document_diagnostics<CR>",    "Document Trouble" },
        q    = { "<cmd>TroubleToggle quickfix<CR>",                    "Quickfix Trouble" },
        l    = { "<cmd>TroubleToggle loclist<CR>",                     "Loclist Trouble" },
        t    = { "<cmd>TodoTrouble<CR>",                               "Todo Trouble" },
        o    = { "<cmd>TodoTelescope<CR>",                             "Telescope Todos" },
    }
}, { prefix = "<leader>" })
require("which-key").register({
    gR     = { "<cmd>TroubleToggle lsp_references<CR>",
			"LSP Trouble" },
    [']x'] = { "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>",
			"Next Trouble" },
    ['[x'] = { "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>",
			"Previous Trouble" },
})

-- todo-comments
require("todo-comments").setup {
    keywords = {
        FIX  = {
            icon  = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt   = { "FIXME", "BUG", "FIXIT", "ISSUE", "OH SHIT" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        HACK = { icon = " ", color = "error",   alt = { "XXX", "NO", "CURSED", "EXORCISM NEEDED", "OK, SO", "WTF" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "WOW", "DRAGONS", "UH OH", "HWAT", "WHAT" } },
        TODO = { icon = " ", color = "warning", alt = { "PLEASE", "UNFORTUNATELY", "WELL, ACTUALLY" } },
        HELP = { icon = " ", color = "info",    alt = { "CHECK", "CHECKME", "HELP WANTED", "WELL", "MAYBE" } },
        NOTE = { icon = " ", color = "hint",    alt = { "NOTE", "LOOK", "IMPORTANT", "INFO", "YES", "YAY" } },
        PERF = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    },
    highlight = {
        before        = "bg",                  -- "fg" or "bg" or empty
        keyword       = "wide",                -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after         = "bg",                  -- "fg" or "bg" or empty
        pattern       = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
        comments_only = true,                  -- uses treesitter to match keywords in comments only
        max_line_len  = 400,                   -- ignore lines longer than this
        exclude       = {},                    -- list of file types to exclude highlighting
    },
    colors = {
        error   = { "LspDiagnosticsDefaultError",         "ErrorMsg",   "#DC2626" },
        warning = { "LspDiagnosticsDefaultWarning",       "WarningMsg", "#FBBF24" },
        info    = { "LspDiagnosticsDefaultInformation",                 "#2563EB" },
        hint    = { "LspDiagnosticsDefaultHint",                        "#10B981" },
        default = { "Identifier",                                       "#7C3AED" },
    },
}

-- fern config
vim.g['fern#renderer'] = "nerdfont"
require("which-key").register({
    e = { "<cmd>Fern . -reveal=%<CR>", "Explore Directory Tree" }
}, { prefix = "<leader>" })

-- tab management
vim.g.rooter_cd_cmd = 'tcd'
vim.g.rooter_targets = '/,*'
vim.g.rooter_resolve_links = true
vim.g.taboo_tab_format = " %m%P%I⎠"
vim.g.taboo_renamed_tab_format = " %l%I%m⎠"

-- TODO: also navigate tabs/buffers with hjkl
-- TODO: resize windows and switch windows with arrows and hjkl
-- TODO: match with tmux/nvim navigation with arrows and hjkl
require("which-key").register({
    ["<C-A-Right>"] = { "<cmd>tabnext<CR>", "Next Tab" },
    ["<C-A-Left>"] = { "<cmd>tabprevious<CR>", "Previous Tab" },
    ["<C-A-Up>"] = { "<cmd>bnext<CR>", "Next Buffer" },
    ["<C-A-Down>"] = { "<cmd>bprevious<CR>", "Previous Buffer" },
})

-- dashboard options
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_session_directory = vim.env.HOME .. '/local/share/nvim/sessions'

vim.cmd [[
    autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]]

vim.g.dashboard_custom_header = {
    ' ██████▒██▓  █████▄  ▄█░ ▒█    ▄███████ ▒████▒  ▄██████ ▄███████▓    ▄█▀███   █   ░██  ███▄    █  ███▄    █ ▓█████  ██▀███░ ',
    '▓██   ▒▓██▒▒██    ▒ ▓██░ ██▒   ▓  ██▒ ▓▒▓█  ░  ▒██    ▒ ▓  ██▒ ▓▒   ▓██ ▒ ██▒ ██  ▓██▒ ██ ▀█   █  ██ ▀█   █ ▓█   ▀ ▓██ ▒ ██▒',
    '▒████ ░▒██▒░ ▓██▄   ▒██▀▀██░   ▒ ▓██░ ▒░▒███   ░ ▓██▄   ▒ ▓██░ ▒░   ▓██ ░▄█ ▒▓██  ▒██░▓██  ▀█ ██▒▓██  ▀█ ██▒▒███   ▓██ ░▄█ ▒',
    '░▓█▒  ░░██░  ▒   ██▒░▓█ ░██    ░ ▓██▓ ░ ▒▓█░ ▄   ▒ ░ ██▒░ ▓██▓ ░    ▒██▀▀█▄  ▓▓█  ░██░▓██▒  ▐▌██▒▓██▒  ▐▌██▒▒▓█  ▄ ▒██▀▀█▄  ',
    '░▓█░   ░██░▒▀█████▒▒░▓█▒░██▓     ▒██▒ ░ ░▓████▒▒██████▒▒  ▒██▒ ░    ░██▓ ▒██▒▒▒█████▓ ▒██░   ▓██░▒▀█░   ▓██░░▓████▒░▀█▓ ▒██▒',
    ' ▒ ░   ░▓  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒     ▒ ░░   ░░ ▒░ ░▒ ▒▓▒ ▒ ░  ▒ ░░      ░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░',
    ' ░      ▒ ░░ ░▒  ░ ░ ▒ ░ ▄  ▄░           ░ ░  ░░ ░▒  ░ ░    ░         ░▒ ░ ▒░░░▒░ ░ ░ ░ ░░   ░ ▒░░ ░░   ░ ▒░ ░ ░  ░  ░▒ ░ ▒░',
    ' ░ ░    ▒ ░░  ░  ░   ▄█▄ █▀█▀█ ▄█▄         ░   ░  ░    ░    ░           ░░   ░  ░░░ ░ ░  ░   ░░░        ░ ░    ░  ▒  ░░   ░ ',
    '                    ▀▀████▄█▄████▀▀                                      ░      ▒░           ░ ░        ░      ░  ░   ░     ',
    '                        ▀█▀█▀                                                   ▒            ░                 ░      ░     ',
}

vim.g.dashboard_custom_footer =  {
    '                                                                                                                            ',
    '                                                                                                     ▄   ▄                  ',
    '                                                                                                     █▀█▀█                  ',
    '                                                                                                     █▄█▄█                  ',
    '                                                                                                      ███  ▄▄               ',
    '                                                                                                      ████▐█ █              ',
    '    ▄▄▄▄  ▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄   ▄▄  ▄▄▄   ▄▄▄▄ ▄▄▄▄▄                                                      ████   █              ',
    '█████▄─▄▄▀█▄─▄█▄─▄▄─█▄─▄▄─██▀▄─██▄─▄███─▄▄─█─▄─▄─██████████████████████████████████████████████████   ████▄▄█▀   ███████████',
    '██████─██─██─███─▄████─▄████─▀─███─██▀█─██─███─█████████████████████████████████████████████████████████████████████████████',
    '█████▄▄▄▄██▄▄▄█▄▄▄███▄▄▄███▄▄█▄▄█▄▄▄▄▄█▄▄▄▄██▄▄▄████████████████████████████████████████████████████████████████████████████',
    '████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████',
    '▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀',
    '                                                                                    Alice Davis <alice@gigantic.computer>   ',
}

-- Gutentags
vim.g.gutentags_enabled=1
vim.g.gutentags_plus_nomap = 1
vim.g.gutentags_modules = { 'ctags', 'gtags_cscope' }
vim.g.gutentags_project_root = { '.root', 'Makefile', '.git', '.diffalot' }
vim.g.gutentags_add_default_project_roots = 1
vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')
vim.g.gutentags_plus_switch = 1

-- prose options

-- plasticboy/vim-markdown
vim.g.vim_markdown_folding_disabled = true
vim.g.vim_markdown_no_default_key_mappings = false
vim.g.vim_markdown_follow_anchor = true
vim.g.vim_markdown_frontmatter = true
vim.g.vim_markdown_strikethrough = true
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_no_extensions_in_markdown = true
vim.g.vim_markdown_autowrite = true

-- lexical
vim.g['lexical#spell']      = 1
vim.g['lexical#spelllang']  = { 'en_us', 'en_ca', 'en_gb' }
vim.g['lexical#thesaurus']  = { '~/.config/nvim/spell/MobyThesaurus.txt' }
vim.g['lexical#dictionary'] = { '/usr/share/dict/words' }

-- Ditto
vim.g.ditto_mode = 'paragraph'
vim.cmd[[ let g:ditto_dir = &l:runtimepath . "/spell" ]]

-- Prose Mode
vim.cmd [[
function! Prose(...)
    if a:0 > 0
        let pencil_opts = a:1
    else
        let pencil_opts = {}
    end
    call pencil#init(pencil_opts)
    call lexical#init()
    call litecorrect#init()
    call textobj#quote#init({'educate': 1})
    call textobj#sentence#init()

    " Ditto Setup
    DittoOn
    DittoUpdate
    nnoremap <buffer> <silent> ]o  <Plug>DittoNext    " Jump to the next word
    nnoremap <buffer> <silent> [o  <Plug>DittoPrev    " Jump to the previous word
    nnoremap <buffer> <silent> zdg <Plug>DittoGood    " Ignore the word under the cursor
    nnoremap <buffer> <silent> zdw <Plug>DittoBad     " Stop ignoring the word under the cursor

    " manual reformatting shortcuts
    nnoremap <buffer> <silent> Q gqap
    xnoremap <buffer> <silent> Q gq
    nnoremap <buffer> <silent> <leader>qq vapJgqap

    " toggle pencil autoformat
    noremap <silent> <F7> :<C-u>PFormatToggle<cr>
    inoremap <silent> <F7> <C-o>:PFormatToggle<cr>

    " force top correction on most recent misspelling
    nnoremap <buffer> <C-s> [s1z=<c-o>
    inoremap <buffer> <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u

    " replace common punctuation
    iabbrev <buffer> -- –
    iabbrev <buffer> --- —
    iabbrev <buffer> << «
    iabbrev <buffer> >> »

    " replace typographical quotes (reedes/vim-textobj-quote)
    nnoremap <buffer> <leader>qe <Plug>ToggleEducate
    nnoremap <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
    nnoremap <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

    " highlight words (reedes/vim-wordy)
    noremap <silent> <buffer> <F6> :<C-u>NextWordy<cr>
    xnoremap <silent> <buffer> <F6> :<C-u>NextWordy<cr>
    inoremap <silent> <buffer> <F6> <C-o>:NextWordy<cr>

endfunction

" automatically initialize buffer by file type
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,text call Prose({'wrap': 'soft'})
    autocmd Filetype git,gitsendemail,*commit*,*COMMIT* call Prose({'wrap': 'hard', 'textwidth': 72, 'autoformat': 1})
augroup END

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()
]]

-- Goyo Zen Mode
vim.cmd [[
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 250

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#adadad'

" Default: 0.5
let g:limelight_default_coefficient = 0.8

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" autocommands to dim surrounding paragraphs with limelight, when Goyo active
function! Goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! Goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter call Goyo_enter()
autocmd! User GoyoLeave call Goyo_leave()

function! ZenMode ()
    DittoOff
    Wordy off
    Goyo 120x70%
endfunction

command! Zen :call ZenMode()
]]

-- luapad
require 'luapad'.config{
  count_limit = 150000,
  error_indicator = false,
  eval_on_move = true,
  error_highlight = 'WarningMsg',
  on_init = function()
    print 'Hello from Luapad!'
  end,
  context = {
    the_answer = 42,
    shout = function(str) return(string.upper(str) .. '!') end
  }
}

--mapped keybinding sequence timeout
vim.o.timeoutlen = 750

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd [[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- import prefs
require('alice.preferences')

--Set colorscheme (order is important here)
vim.o.termguicolors = true
-- 'darker', 'lighter', 'palenight', 'oceanic' and 'deep ocean'
vim.g.material_style = "oceanic"
vim.g.material_contrast = true
vim.g.material_lighter_contrast = true
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = false
vim.g.material_italic_functions = true
vim.g.material_italic_variables = true
vim.g.material_borders = true
vim.g.material_hide_eob = true
vim.g.material_disable_background = true
require("which-key").register({
    c = { "<cmd>lua require('material.functions').toggle_style()<CR>", "Cycle Material Style" }
}, { prefix = "<leader>" })
require('material').set()

-- lsp-status setup
_G.lsp_statusline = require("lsp-status.statusline")
_G.lsp_statusline._init({}, { status_symbol = '𝔏' })

vim.cmd [[
let g:Lsp_status = luaeval('_G.lsp_statusline.status')
]]
--Set statusbar
vim.g.lightline = {
    colorscheme = 'one',
    tabline = {
        left = {
            { 'tabs' }
        },
        right = {
        }
    },
    active = {
        left = {
            { 'mode', 'pencilmode', 'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified' }
        },
        right = {
            { 'charvaluehex', 'lineinfo' },
            { 'percent' },
            { 'fileformat', 'fileencoding', 'filetype', 'lspstatus' }
        }
    },
    component = {
        charvaluehex = '0x%B'
    },
    component_function = {
        gitbranch = 'fugitive#head',
        pencilmode = 'PencilMode',
        lspstatus = 'Lsp_status',
    },
}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer', 'dashboard' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitGutterAdd',    text = '+' },
        change       = { hl = 'GitGutterChange', text = '~' },
        delete       = { hl = 'GitGutterDelete', text = '_' },
        topdelete    = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' },
    },
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n ]g'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
        ['n [g'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

        ['n <leader>gn'] = '<cmd>lua require"gitsigns.actions".next_hunk()<CR>',
        ['n <leader>gp'] = '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>',

        ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

        -- Text objects
        ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
}

-- Telescope
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-t>"] = trouble.open_with_trouble,
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
            n = { ["<C-t>"] = trouble.open_with_trouble },
        },
    },
}

-- <leader> keybindings
-- TODO: use a list of buffers associated with a tab rather than CWD buffers
-- TODO: when selecting from "all buffers" switch to containing tab then open buffer
tele_ivy = require('telescope.themes').get_ivy
require("which-key").register({
    ["<space>"] = { "<cmd>lua require('telescope.builtin').buffers( tele_ivy({ winblend = 10, only_cwd = true }) )<CR>",
					"Tabpage Buffers" },
    ["?"]       = { "<cmd>lua require('telescope.builtin').oldfiles( tele_ivy({ winblend = 10}) )<CR>",
                    "Recent Files"},
    b           = { "<cmd>lua require('telescope.builtin').buffers( tele_ivy({ winblend = 10}) )<CR>",
					"All Buffers" },
    h           = { "<cmd>lua require('telescope.builtin').help_tags( tele_ivy({ winblend = 10}) )<CR>",
                    "Search Help Tags" },
    j           = { "<cmd>tabnew ~/cronofiles/journal/index.md<CR>",
                    "Journal" },
    q           = { name = "Prose" },
    g           = { name = "Git" },
    s = {
        name = "Search",
        f = { "<cmd>lua require('telescope.builtin').fd( tele_ivy({ winblend = 10}) )<CR>",
				"Search for File" },
        g = { "<cmd>lua require('telescope.builtin').live_grep( tele_ivy({ winblend = 10}) )<CR>",
				"Live Grep" },
        s = { "<cmd>lua require('telescope.builtin').grep_string( tele_ivy({ winblend = 10}) )<CR>",
				"Search For String Under Cursor" },
        b = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find( tele_ivy({ winblend = 10}) )<CR>",
				"Search in Current Buffer" },
        t = { "<cmd>lua require('telescope.builtin').treesitter( tele_ivy({ winblend = 10}) )<CR>",
				"Search Treesitter Symbols" },
        t = { "<cmd>lua require('telescope.builtin').tags( tele_ivy({ winblend = 10}) )<CR>",
				"Search Tags" },
        o = { "<cmd>lua require('telescope.builtin').tags( tele_ivy({ winblend = 10, only_current_buffer = true }) )<CR>",
                "Search Tags in Current Buffer" },
    },
    -- TODO: add descriptions for mappings defined elsewhere
    -- TODO: figure out how to do treesitter selections and motions
    -- TODO: add more prefixes
    --   - r = { name = "REPLs/Calculators" }
    --   - w = { name = "Workspace Management"
    --              -- move/resize windows
    --              -- open files newtab/vsplit/hsplit
    --              -- add/rm tabs
    --              -- mv/cp/rm buffers b/w tabs
}, { prefix = "<leader>" })

-- Highlight on yank
vim.api.nvim_exec(
    [[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
    ]],
    false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--  ██        ████████ ███████     ████████           ██     ██   ██
-- ░██       ██░░░░░░ ░██░░░░██   ██░░░░░░           ░██    ░██  ░░            █████
-- ░██      ░██       ░██   ░██  ░██         █████  ██████ ██████ ██ ███████  ██░░░██  ██████
-- ░██      ░█████████░███████   ░█████████ ██░░░██░░░██░ ░░░██░ ░██░░██░░░██░██  ░██ ██░░░░
-- ░██      ░░░░░░░░██░██░░░░    ░░░░░░░░██░███████  ░██    ░██  ░██ ░██  ░██░░██████░░█████
-- ░██             ░██░██               ░██░██░░░░   ░██    ░██  ░██ ░██  ░██ ░░░░░██ ░░░░░██
-- ░████████ ████████ ░██         ████████ ░░██████  ░░██   ░░██ ░██ ███  ░██  █████  ██████
-- ░░░░░░░░ ░░░░░░░░  ░░         ░░░░░░░░   ░░░░░░    ░░     ░░  ░░ ░░░   ░░  ░░░░░  ░░░░░░
--
-- # LSP settings

-- vim.lsp.set_log_level("debug")
--
-- needs https://github.com/microsoft/vscode-codicons/blob/master/dist/codicon.ttf
-- setup in the terminal (kitty.conf) with ``
require("vim.lsp.protocol").CompletionItemKind = {
  "  Text",          -- = 1
  "  Function",      -- = 2;
  "  Method",        -- = 3;
  "  Constructor",   -- = 4;
  "  Field",         -- = 5;
  "  Variable",      -- = 6;
  "  Class",         -- = 7;
  "  Interface",     -- = 8;
  "  Module",        -- = 9;
  "  Property",      -- = 10;
  "  Unit",          -- = 11;
  "  Value",         -- = 12;
  "  Enum",          -- = 13;
  "  Keyword",       -- = 14;
  "  Snippet",       -- = 15;
  "  Color",         -- = 16;
  "  File",          -- = 17;
  "  Reference",     -- = 18;
  "  Folder",        -- = 19;
  "  EnumMember",    -- = 20;
  "  Constant",      -- = 21;
  "  Struct",        -- = 22;
  "  Event",         -- = 23;
  "  Operator",      -- = 24;
  "  TypeParameter", -- = 25;
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = { prefix = " " } })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

local icons = require("nvim-nonicons")
vim.fn.sign_define("LspDiagnosticsSignError",
                   { text = icons.get("x-circle"), texthl = "LspDiagnosticsSignError" })

vim.fn.sign_define("LspDiagnosticsSignWarning",
                   { text = icons.get("alert"), texthl = "LspDiagnosticsSignWarning" })

vim.fn.sign_define("LspDiagnosticsSignInformation",
                   { text = icons.get("info"), texthl = "LspDiagnosticsSignInformation" })

vim.fn.sign_define("LspDiagnosticsSignHint",
                   { text = icons.get("comment"), texthl = "LspDiagnosticsSignHint" })

-- require("vim.lsp.codelens").setup()

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

    -- vim already has builtin docs
    if vim.bo.ft ~= "vim" then buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts) end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end

    -- if client.resolved_capabilities.code_lens then
    --     vim.cmd [[
    --         augroup lsp_codelens
    --             autocmd! * <buffer>
    --             autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua require"lsp-codelens".buf_codelens_refresh()
    --         augroup END
    --     ]]
    -- end

    if client.server_capabilities.colorProvider then
        require"lsp-documentcolors".buf_attach(bufnr, { single_column = true })
    end
end

-- Configure lua language server for neovim development
local lua_settings = {
    Lua = {
        runtime = {
            -- LuaJIT in the case of Neovim
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            },
        },
    },
}

-- config that activates keymaps and enables snippet support
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

-- lua css html typescript graphql bash vim json yaml

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    -- ... and add manually installed servers
    -- table.insert(servers, "sourcekit")

    for _, server in pairs(servers) do
        local config = make_config()

        -- language specific config
        if server == "lua" then
            config.settings = lua_settings
            config.root_dir = function(fname)
                if fname:match("lush_theme") ~= nil then return nil end
                local util = require "lspconfig/util"
                return util.find_git_ancestor(fname) or util.path.dirname(fname)
            end
        end
        if server == "vim" then config.init_options = { isNeovim = true } end

        -- apply the config
        require"lspconfig"[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- UI just like `:LspInfo` to show which capabilities each attached server has
vim.api.nvim_command("command! LspCapabilities lua require'lsp-capabilities'()")

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,noinsert'

-- Compe setup
require('compe').setup {
    source = {
        path = true,
        nvim_lsp = true,
        luasnip = true,
        buffer = false,
        calc = false,
        nvim_lua = false,
        vsnip = false,
        ultisnips = false,
    },
}

-- Utility functions for compe and luasnip
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require 'luasnip'

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif luasnip.expand_or_jumpable() then
        return t '<Plug>luasnip-expand-or-jump'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    elseif luasnip.jumpable(-1) then
        return t '<Plug>luasnip-jump-prev'
    else
        return t '<S-Tab>'
    end
end

-- Map tab to the above tab complete functiones
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
