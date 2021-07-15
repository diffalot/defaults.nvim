vim.cmd('let g:nvcode_termcolors=256')

-- TokyoNight Theme Settings
vim.g.tokyonight_style                    = "night"
vim.g.tokyonight_terminal_colors          = "true"
vim.g.tokyonight_italic_comments          = "true"
vim.g.tokyonight_italic_keywords          = "true"
vim.g.tokyonight_italic_functions         = "false"
vim.g.tokyonight_italic_variables         = "false"
vim.g.tokyonight_transparent              = "false"
vim.g.tokyonight_hide_inactive_statusline = "false"
vim.g.tokyonight_dark_sidebar             = "true"
vim.g.tokyonight_dark_float               = "true"
vim.g.tokyonight_day_brightness           = "0.04"

vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.g.pencil_higher_contrast_ui = 0  -- 0 = low(def),1  = high
vim.g.pencil_neutral_headings   = 1  -- 0 = blue(def),1 = normal
vim.g.pencil_neutral_code_bg    = 0  -- 0 = gray(def),1 = normal
vim.g.pencil_gutter_color       = 1  -- 0 = mono(def),1 = color
vim.g.pencil_spell_undercurl    = 1  -- 0 = underline,1 = undercurl(def)
vim.g.pencil_terminal_italics   = 1

--vim.cmd('colorscheme pencil')
