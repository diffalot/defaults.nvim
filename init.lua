vim.cmd('\<Esc>[38:2:%lu:%lu:%lum')
vim.cmd('\<Esc>[48:2:%lu:%lu:%lum')
vim.cmd('set termguicolors')

-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'        -- Package manager

  use 'neovim/nvim-lspconfig'         -- Collection of configurations for built-in LSP client
  use 'nvim-lua/lsp-status.nvim'      -- Statusline info from LSP ready to customize and already using nerdfonts
  use 'hrsh7th/nvim-compe'            -- Autocompletion plugin

  -- Add git related info in the signs columns and popups
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'lambdalisue/gina.vim'          -- Run Git commands asyncronously from the command prompt

  -- Treesitter playground - visualizer and explorer for TS parses
  use {'nvim-treesitter/playground', opt = true, event = "BufRead"}

  -- UI to select things (files, grep results, open buffers...)
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  -- use 'ludovicchabant/vim-gutentags'  -- Automatic tags management

  -- Treesitter -  something in between CTags and LSP that analyses parses code
  -- trees very quickly from known grammars for fast and adaptable
  -- highlighting
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  -- nvim .5 LSP Highlight Groups for most themes, can adapt to CoC themes too 
  use {"folke/lsp-colors.nvim", event = "BufRead",}
  -- A revisit of vim's `default` 16 color scheme, less garish and more useful
  use 'romainl/vim-colors'            

  -- -- "gc" to comment visual regions/lines
  -- use 'tpope/vim-commentary'          
  -- -- Add indentation guides even on blank lines
  use {'lukas-reineke/indent-blankline.nvim', branch="lua" }
  use {"folke/todo-comments.nvim",event = "BufRead"}
  -- -- diagnostics
  use {"folke/trouble.nvim",cmd = 'TroubleToggle'}

  -- Debugging
  use {"mfussenegger/nvim-dap",event = "BufRead"}
  -- Debugger management
  use {'Pocco81/DAPInstall.nvim',event = "BufRead"}   


  -- Write mappings for prefixes that will popup as menus to help you learn
  -- your way around the keyboard interface.  Default motions, spelling, and
  -- window control are also included. 
  use {"folke/which-key.nvim"}
 
  -- INFO: Learning Lua central collections of resources
  -- https://github.com/nanotee/nvim-lua-guide
  -- https://github.com/norcalli/neovim-plugin

  -- a repl with access to neovim's internal runtime, great for playing with 
  -- your codehttps://github.com/rafcamlet/nvim-luapad
  use { 'rafcamlet/nvim-luapad', opt = false }

  -- Interactive scratchpad and general purpose REPL for many languages
  -- use {'metakirby5/codi.vim', cmd = 'Codi'}

  -- Learn Vim Motions
  -- https://github.com/ThePrimeagen/vim-be-good
  use 'ThePrimeagen/vim-be-good'

  -- Create and manage parametric highlight groups in lua
  use 'tjdevries/colorbuddy.vim'      
  
  -- A fast colorpreviewer written in lua to see your cor codes in your editor
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
      vim.cmd("ColorizerReloadAllBuffers")
    end,
  }


--------------
-- Preferences

vim.o.pumheight = 15 -- Makes popup menu smaller
vim.cmd('set foldlevel=3')

-- treat dash separated words as a single text object"
vim.cmd('set iskeyword+=-')

-- Don't flood completion with messages.
vim.cmd('set shortmess+=c')

-- Copy paste between vim and system clipboard
vim.o.clipboard = "unnamedplus" 

--Incremental live completion
vim.o.inccommand = "nosplit"

-- directional keys move to next visual line even when soft wrapped
vim.cmd('set whichwrap+=<,>,[,],h,l') 

--Make line numbers default
vim.wo.number = true
                      
--Do not save when switching buffers
vim.o.hidden = true

vim.o.mouse = "a" --Enable mouse mode

-- Use the filetype folder to manage setting for specific languagaes 
-- and turn on syntax highlighting
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

-- The encoding written to file
vim.o.fileencoding = "utf-8"
                  
--Expand tabs to 4 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.cmd('set expandtab')

--Use 80 colums with smart soft breaks by default
vim.cmd('set colorcolumn=79')
vim.cmd('set textwidth=0')
vim.cmd('set autoindent breakindent linebreak')
vim.cmd('set formatoptions+=jtcropqblnJ')

--I would turn on special character display if tabs were hiding out around here
vim.cmd('set list listchars="tab:➤ ,eol:¶,nbsp:⇆,trail:✧"')
--vim.cmd('set list listchars=tab:»\ ,eol:↲,nbsp:⇋,trail:‹')

--Save undo history
vim.cmd[[set undofile]]

--Do not resize windows to equal sizes when one is closed
vim.cmd('set noequalalways')

--Allow windows to be closed completely without a line of tex between the statuslines
vim.cmd('set winminheight=0')

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Case insensitive searching at all times
vim.o.ignorecase = true
vim.o.smartcase = false

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd[[colorscheme default]]

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", {noremap= true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Remap escape to leave terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], {noremap = true})

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
    print("Mouse enabled")
  end
end

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})

-- Change preview window location
vim.g.splitbelow = false

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})
--
-- Treesitter Configs
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",   -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,                   -- false will disable the whole extension
    disable = {},                    -- list of language that will be disabled
  },
  indent = {enable = {"javascriptreact"}},
  autotag = {enable = true},

  playground = {
    enable = O.plugin.ts_playground.active,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?'
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}


--
-- LSP settings
local nvim_lsp = require('lspconfig')
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local sumneko_root_path = vim.fn.getenv("HOME").."/.local/bin/sumneko_lua" -- Change to your sumneko root installation
local sumneko_binary_path = "/bin/linux/lua-language-server" -- Change to your OS specific output folder
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_root_path .. sumneko_binary_path, "-E", sumneko_root_path.."/main.lua" };
  on_attach = on_attach,
  settings = {
      Lua = {
          runtime = {
              version = 'LuaJIT',
              path = vim.split(package.path, ';'),
          },
          diagnostics = {
              globals = {'vim'},
          },
          workspace = {
              library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
          },
      },
  },
}

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert"

-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})








  -- Personal Favorites
  use 'editorconfig/editorconfig-vim' -- Have indentation and tabs set by the repository
  use 'iberianpig/tig-explorer.vim'   -- Run Tig in Neovim
  -- https://github.com/junegunn/vim-easy-align
  use 'junegunn/vim-easy-align'
  -- prose tools ------------------------------------------------------------
  -- until I decide on one, I'll be enabenabling one markdown plugin at a time
  -- use { 'vimwiki/vimwiki', opt = true }
  -- require_plugin('vim-wiki')
  use 'preservim/vim-lexical'
  use 'plasticboy/vim-markdown'
  use 'reedes/vim-pencil'
  use 'preservim/vim-wordy'
  use 'vim-ctrlspace/vim-ctrlspace'
  use 'Shougo/tabpagebuffer.vim'
  -- https://github.com/junegunn/limelight.vim
  use { 'junegunn/limelight.vim', opt = true }
    -- Floating terminal
    use {
        'numToStr/FTerm.nvim',
        event = "BufRead",
        config = function()
            require'FTerm'.setup({
                     cmd = "cd ~;  tmux new-session -A -s floating",
                     dimensions  = {
                     height = 0.4,
                     width = 0.56,
                     x = 1.3,
                     y = -0.00
                 },
                 border = 'single' -- or 'double'
            })
        end,
    }
end)
