-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/alice/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/alice/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/alice/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/alice/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/alice/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0)\4\0\0\20\4\4\0=\4\5\3=\3\6\2B\0\2\1K\0\1\0\15dimensions\6y\1\0\3\nwidth\4ì£áõ\1…×‡ÿ\3\6x\4Í™³æ\fÌ™Óÿ\3\vheight\4š³æÌ\t™³æþ\3\1\0\2\vborder\vsingle\bcmd+cd ~;  tmux new-session -A -s floating\nsetup\nFTerm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/FTerm.nvim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["limelight.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\ni\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\30ColorizerReloadAllBuffers\bcmd\bvim\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["tabpagebuffer.vim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/tabpagebuffer.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tig-explorer.vim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/tig-explorer.vim"
  },
  ["todo-comments.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-be-good"
  },
  ["vim-colors"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-colors"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-ctrlspace"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-ctrlspace"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-lexical"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-lexical"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-pencil"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-pencil"
  },
  ["vim-wordy"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/vim-wordy"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/alice/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'DAPInstall.nvim', 'nvim-dap', 'playground', 'todo-comments.nvim', 'nvim-colorizer.lua', 'lsp-colors.nvim', 'FTerm.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ".v:exception | echom "Please check your config for correctness" | echohl None')
end
