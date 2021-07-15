require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w> nav = true, -- misc bindings to work with windows z = true, -- bindings for folds, spelling and others prefixed with z g = true -- bindings for prefixed with g }, spelling = { enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions suggestions = 30, -- how many suggestions should be shown in the list?  }, },
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "➣" , -- symbol used in the command line area that shows your active key combo
        separator = "➩" , -- symbol used between a key and it's label
        group = "⁂ " -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 1, 1, 1}, -- extra window margin [top, right, bottom, left]
        padding = {1, 1, 1, 1} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 7, max = 20}, -- min and max height of the columns
        width = {min = 22, max = 54}, -- min and max width of the columns
        spacing = 2 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use ` nowait` when creating keymaps
}

-- FTerm
--vim.api.nvim_set_keymap('n', '<A-`>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })

-- Comments
--vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>",
 --                       {noremap = true, silent = true})
--vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>",
 --                       {noremap = true, silent = true})

-- CHECK: after reboot see if anything happened
-- close buffer
--vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>",
--                        {noremap = true, silent = true})
--
---- open projects
--vim.api.nvim_set_keymap('n', '<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>",
--                        {noremap = true, silent = true})

-- nvim-compe key map
vim.cmd('inoremap <silent><expr> <C-Space> compe#complete()')
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")


vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')



-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Toggle the QuickFix window
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- close buffer INFO: found a menu item to close a buffer in CtrlSpace
--vim.api.nvim_set_keymap("n", "<leader>c", ":bdelete<CR>",  {noremap = trtue, silent = true})

-- Move between Tabs with Ctrl + Alt and the left and right arrows
vim.api.nvim_set_keymap('n', '<C-A-Right>', ':tabnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-Left>',  ':tabprevious<CR>', {noremap = true, silent = true})
-- Cycle Buffers with Ctrl + Alt and the Up and Down Arrows
vim.api.nvim_set_keymap('n', '<C-A-Up>',   ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-Down>', ':bprevious<CR>', {noremap = true, silent = true})


-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Toggle the QuickFix window
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- close buffer INFO: found a menu item to close a buffer in CtrlSpace
--vim.api.nvim_set_keymap("n", "<leader>c", ":bdelete<CR>",  {noremap = trtue, silent = true})

-- Move between Tabs with Ctrl + Alt and the left and right arrows
vim.api.nvim_set_keymap('n', '<C-A-Right>', ':tabnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-Left>',  ':tabprevious<CR>', {noremap = true, silent = true})
-- Cycle Buffers with Ctrl + Alt and the Up and Down Arrows
vim.api.nvim_set_keymap('n', '<C-A-Up>',   ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-Down>', ':bprevious<CR>', {noremap = true, silent = true})






-- TODO create entire treesitter section

local mappings = {

   [ "/"] =   "Comment",
   ["\\"] = { ":Telescope<CR>",          "Telescope"},
   [ "h"] = { ":set hlsearch!<CR>",      "Search Highlight Toggle"},
   --[ "f"] =   "Find File",
  -- [ "e"] = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
  -- [ "a"] = { ":Dashboard<CR>",          "Dashboard"},
    b = {
        name = "Buffers",
        j = { "<cmd>BufferPick<cr>",               "jump to buffer" },
        f = { "<cmd>Telescope buffers<cr>",        "All buffers" },
        w = { "<cmd>BufferWipeout<cr>",            "wipeout buffer" },
        e = { "<cmd>BufferCloseAllButCurrent<cr>", "close all but current buffer" },
        h = { "<cmd>BufferCloseBuffersLeft<cr>",   "close all buffers to the left" },
        l = { "<cmd>BufferCloseBuffersRight<cr>",  "close all BufferLines to the right" },
        D = { "<cmd>BufferOrderByDirectory<cr>",   "sort BufferLines automatically by directory" },
        L = { "<cmd>BufferOrderByLanguage<cr>",    "sort BufferLines automatically by language" }
        },
    d = {
        name = "+Diagnostics",
        t = { "<cmd>TroubleToggle<cr>",                           "trouble" },
        w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
        d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>",  "document" },
        q = { "<cmd>TroubleToggle quickfix<cr>",                  "quickfix" },
        l = { "<cmd>TroubleToggle loclist<cr>",                   "loclist" },
        r = { "<cmd>TroubleToggle lsp_references<cr>",            "references" },
        },
--    D = {
--        name = "+Debug",
--        b = { "<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint" },
--        c = { "<cmd>DebugContinue<cr>",         "Continue" },
--        i = { "<cmd>DebugStepInto<cr>",         "Step Into" },
--        o = { "<cmd>DebugStepOver<cr>",         "Step Over" },
--        r = { "<cmd>DebugToggleRepl<cr>",       "Toggle Repl" },
--        s = { "<cmd>DebugStart<cr>",            "Start" },
--        },
             -- TODO: figure out why upstream doesn't use the whichkey mapping for command linking, and manually syncs descriptions only
    p = {    -- FIXME: lots of duplication in b, p, and t
        name = "Windows and Tabs",
        g =  { ":Telescope live_grep theme=get_ivy<CR>", "Grep" },
        b =  { ":Telescope buffers theme=get_ivy<CR>",   "Buffers" },
        m =  { ":Telescope marks theme=get_ivy<CR>",     "Marks" },
        -- j =  { ":VimwikiIndex<CR>",                      "Journal" },
        -- n =  { ":VimwikiTabIndex<CR>",                   "Journal in New Tab" },
        t =  { ":tabnew<CR>",                            "New Tab" },
        --d =  { ":Dashboard<CR>",                         "Dashboard" },
        sf = { ":InfolinesFileInfoToggle<CR>",           "File Drawer" },
        si = { ":InfolinesCharacterInfoToggle<CR>",      "Text Drawer" },
        --sl = { ":InfolinesResetLight<CR><Bar>colorscheme pencil<CR><Bar>InfolinesResetLight<CR>", "Reset to Light Theme" },
        --sd = { ":InfolinesResetDark<CR><Bar>colorscheme pencil<CR><Bar>InfolinesResetLight<CR>", "Reset to Light Theme" },
        p =  { ":TCDtoThisFile<CR>",                     "tcd {This File}" },
        c =  { ":CronofilerSync<CR>",                    "CronofilerSync" },
        },
    t = {
        t = {
            name = "Telescope",
        o = { "<cmd>Telescope oldfiles theme=get_ivy<CR>",   "Recent Files" },
        f = { "<cmd>Telescope find_files theme=get_ivy<CR>", "File Search" },
        g = { "<cmd>Telescope live_grep theme=get_ivy<CR>",  "Live Grep" },
        b = { "<cmd>Telescope buffers theme=get_ivy<CR>",    "All Buffers" },
        m = { "<cmd>Telescope marks theme=get_ivy<CR>",      "Marks" },
        r = { "<cmd>Telescope registers theme=get_ivy<CR>",  "Registers" },
        },
    },

-- diagnostics vanilla nvim
-- -- diagnostic
-- function lv_utils.get_all()
--     vim.lsp.diagnostic.get_all()
-- end
-- function lv_utils.get_next()
--     vim.lsp.diagnostic.get_next()
-- end
-- function lv_utils.get_prev()
--     vim.lsp.diagnostic.get_prev()
-- end
-- function lv_utils.goto_next()
--     vim.lsp.diagnostic.goto_next()
-- end
-- function lv_utils.goto_prev()
--     vim.lsp.diagnostic.goto_prev()
-- end
-- function lv_utils.show_line_diagnostics()
--     vim.lsp.diagnostic.show_line_diagnostics()
-- end

    -- " Available Debug Adapters:
    -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
    -- " Adapter configuration and installation instructions:
    -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    -- " Debug Adapter protocol:
    -- "   https://microsoft.github.io/debug-adapter-protocol/
    -- " Debugging
    -- command! DebugToggleBreakpoint lua require'dap'.toggle_breakpoint()
    -- command! DebugStart lua require'dap'.continue()
    -- command! DebugContinue lua require'dap'.continue()
    -- command! DebugStepOver lua require'dap'.step_over()
    -- command! DebugStepOut lua require'dap'.step_out()
    -- command! DebugStepInto lua require'dap'.step_into()
    -- command! DebugToggleRepl lua require'dap'.repl.toggle()
    -- command! DebugGetSession lua require'dap'.session()
    -- D = {
    --     name = "Debug",
    --     b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
    --     c = {"<cmd>DebugContinue<cr>", "Continue"},
    --     i = {"<cmd>DebugStepInto<cr>", "Step Into"},
    --     o = {"<cmd>DebugStepOver<cr>", "Step Over"},
    --     r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
    --     s = {"<cmd>DebugStart<cr>", "Start"}
    -- },
    g = {
        name = "Git",
        j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
        l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
        p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk"
        },
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)"
        }
    },
    l = {
        name = "LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics"
        },
        D = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
      --  h = {"<cmd>Lspsaga hover_doc<cr>", "Hover Doc"},
      --  i = {"<cmd>LspInfo<cr>", "Info"},
      --  j = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic"},
      --  k = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic"},
      --  l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
      --  L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
      --  p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
      --  r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols"
        }
    },
  --  r = {
  --      name = "Replace",
  --      f = {
  --          "<cmd>lua require('spectre').open_file_search()<cr>", "Current File"
  --      },
  --      p = {"<cmd>lua require('spectre').open()<cr>", "Project"}
    },
    o = {
        name = "Tags and Analyzers",
        -- v = {"", "Vista"},
        -- t = {"", "TagBar"},
        o = {"", "Symbols Outline"},
        -- Gutentags_plus
        s = {":GscopeFind s <C-R><C-W><cr>"},
        -- noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
        -- noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
        -- noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
        -- noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
        -- noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
        f = {":GscopeFind f <C-R>=expand('<cfile>')<cr><cr>"},
        -- noremap <silent> <leader>gf :GscopeFind f <C-R>y=expand("<cfile>")<cr><cr>
        -- noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
        -- noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
        -- noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
    },
    s = {
        name = "Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        -- d = {
        --     "<cmd>Telescope lsp_document_diagnostics<cr>",
        --     "Document Diagnostics"
        -- },
        -- D = {
        --     "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        --     "Workspace Diagnostics"
        -- },
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        -- m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
   -- S = {
   --     name = "Session",
   --     s = {"<cmd>SessionSave<cr>", "Save Session"},
   --     l = {"<cmd>SessionLoad<cr>", "Load Session"}
   -- }
}

if O.plugin.trouble.active then
    mappings['d'] = {
        name = "Diagnostics",
        t = {"<cmd>TroubleToggle<cr>", "trouble"},
        w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
        d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
        l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
        r = {"<cmd>TroubleToggle lsp_references<cr>", "references"}
    }
end

if O.plugin.gitlinker.active then mappings["gy"] = "Gitlink" end
if O.plugin.zen.active then
    vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>",
                            {noremap = true, silent = true})
    mappings["z"] = "Zen"
end
if O.plugin.lazygit.active then
    vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>",
                            {noremap = true, silent = true})
    mappings["gg"] = "LazyGit"
end
if O.plugin.telescope_project.active then
    -- open projects
    vim.api.nvim_set_keymap('n', '<leader>p',
                            ":lua require'telescope'.extensions.project.project{}<CR>",
                            {noremap = true, silent = true})
    mappings["p"] = "Projects"
end

-- [";"] = "Dashboard",


local wk = require("which-key")
wk.register(mappings, opts)
