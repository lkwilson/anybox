-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-w>", "<leader>bd", { desc = "Delete current buffer", remap = true })

vim.keymap.set("n", "<leader>w", function()
	Snacks.bufdelete.all()
end, { desc = "Delete all buffers" })
