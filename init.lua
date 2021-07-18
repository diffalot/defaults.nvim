vim.cmd [[
if &shell =~# 'fish$'
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

-- TODO: 
-- - theme development
--   - add lush plugin
--   - add color preview thing
--   - add goog=
-- - checkout vmux for single nvim per tmux session https://github.com/jceb/vmux
--   - this is probably way better: https://github.com/carlocab/tmux-nvr
-- - setup fish shell format and linting
-- - install development plugins
--   - install lua & formatting & linting
--   - https://github.com/kosayoda/nvim-lightbulb shows lsp code actions are available in gutter
--   - todo-thingy
--   - trouble
--   - https://github.com/rhysd/git-messenger.vim
--   - lsp-status in statusline
--   - install fterm or https://github.com/Lenovsky/nuake
--   - https://github.com/metakirby5/codi.vim
--   - https://github.com/RRethy/vim-illuminate ??
-- - gutentags status in statusline
-- - gutentags use gtags as well as ctags and cache in ~/.cache/tags
-- - vim plugin development
--   - list tabpage buffers in telescope
--   - rename tabs
--   - https://github.com/vim-jp/vital.vim
-- - install prose plugins
--   - wordy https://github.com/preservim/vim-wordy
--   - https://github.com/dbmrq/vim-ditto
--   - https://github.com/preservim/vim-pencil
--   - https://github.com/preservim/vim-litecorrect
--   - https://github.com/kana/vim-textobj-user
--     - https://github.com/preservim/vim-textobj-quote
--     - https://github.com/preservim/vim-textobj-sentence
--   - https://github.com/tpope/vim-abolish
--   - vim-wheel (find the setting for horizontal scroll) https://github.com/preservim/vim-wheel
-- - Good TS/LSP themes?
--   - https://github.com/sainnhe/edge
-- - switch to lualine?
-- - switch to Gina from Fugitive? 
-- - use themis for testing?
-- - check this out when you need a repl not provided by codi https://github.com/hkupty/iron.nvim
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management
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
    use 'williamboman/nvim-lsp-installer' -- add LspInstall <server> command
    use 'hrsh7th/nvim-compe' -- Autocompletion plugin
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    -- Lua Development
    use 'euclidianAce/BetterLua.vim' -- lua highlighting
    use 'rafcamlet/nvim-luapad' -- lua REPL
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
end)

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
    '                                                                                             ▄   ▄                          ',
    '                                                                                             █▀█▀█                          ',
    '                                                                                             █▄█▄█                          ',
    '                                                                                              ███  ▄▄                       ',
    '                                                                                              ████▐█ █                      ',
    '     ▄▄▄▄  ▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄   ▄▄  ▄▄▄   ▄▄▄▄ ▄▄▄▄▄                                             ████   █                      ',
    '█████▄─▄▄▀█▄─▄█▄─▄▄─█▄─▄▄─██▀▄─██▄─▄███─▄▄─█─▄─▄─████████████████████████████████████████████ ████▄▄█▀                      ',
    '██████─██─██─███─▄████─▄████─▀─███─██▀█─██─███─█████████████████████████████████████████████████████████████████████████████',
    '█████▄▄▄▄██▄▄▄█▄▄▄███▄▄▄███▄▄█▄▄█▄▄▄▄▄█▄▄▄▄██▄▄▄████████████████████████████████████████████████████████████████████████████',
    '████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████',
    '▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀',
    '                                                                                    Alice Davis <alice@gigantic.computer>   ',
}

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
vim.cmd [[
let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us', 'en_ca', 'en_gb']
let g:lexical#thesaurus = ['~/.config/nvim/language/MobyThesaurus.txt']
let g:lexical#dictionary = ['/usr/share/dict/words']

augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
]]

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
vim.g.material_disable_background = false
require("which-key").register({
    c = { "<cmd>lua require('material.functions').toggle_style()<CR>", "Cycle Material Style" }
}, { prefix = "<leader>" })
require('material').set()

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
            { 'mode', 'paste' }, 
            { 'gitbranch', 'readonly', 'filename', 'modified' } 
        } 
    },
    component_function = { gitbranch = 'fugitive#head' },
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
        add          = { hl = 'GitGutterAdd', text = '+' },
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
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
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
    --   - p = { name = "Prose" }
    --   - g = { name = "Git" }
    --   - r = { name = "REPLs/Calculators" }
    --   - c = { name = "Schemes" }
    --   - w = { name = "Workspace Management"
    --              -- move/resize windows
    --              -- open files newtab/vsplit/hsplit
    --              -- add/rm tabs
    --              -- mv/cp/rm buffers b/w tabs
    --   -  = { name = "" }
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

-- LSP settings
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable lsp-installer installed servers
local lsp_installed_servers = require('nvim-lsp-installer').get_installed_servers()
for _, lsp in ipairs(lsp_installed_servers) do
    opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lsp:setup(opts)
end

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
