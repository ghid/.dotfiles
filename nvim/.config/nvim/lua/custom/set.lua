vim.g.clipboard = {
    name = "wsl-win32yank",
    copy = {
        ["+"] = { "/home/srp/.local/bin/win32yank.exe", "-i", "--crlf" },
        ["*"] = { "/home/srp/.local/bin/win32yank.exe", "-i", "--crlf" },
    },
    paste = {
        ["+"] = { "/home/srp/.local/bin/win32yank.exe", "-o", "--lf" },
        ["*"] = { "/home/srp/.local/bin/win32yank.exe", "-o", "--lf" },
    },
    cache_enabled = false,
}

--vim.opt.clipboard = "unnamedplus"

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

