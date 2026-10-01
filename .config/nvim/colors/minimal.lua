-- colors/minimal.lua
vim.opt.termguicolors = true
vim.cmd("hi clear")
vim.cmd("syntax reset")
vim.g.colors_name = "minimal"

vim.api.nvim_set_hl(0, "Normal", { fg = "#DEE2E6", bg = "#212529" })
vim.api.nvim_set_hl(0, "Keyword", { fg = "#DEE2E6", bold = true })
vim.api.nvim_set_hl(0, "Function", { fg = "#6EA8FE", italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#198754" })
vim.api.nvim_set_hl(0, "Type", { fg = "#FFC107" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#6C757D", italic = true })

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#FFC107" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" })
vim.api.nvim_set_hl(0, "WarningMsg", { undercurl = true, sp = "#FFC107" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#00FF00" })
vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#FF0000" })
