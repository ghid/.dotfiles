vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

vim.keymap.set("n", "<C-x>", function()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. '(* *)' .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
end)
