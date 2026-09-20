-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable LazyVim's formatter when writing a buffer. Manual formatting remains
-- available through the usual formatting keymap.
vim.g.autoformat = false

-- Keep `gq` useful for prose: wrap an explicitly selected paragraph at 80
-- columns using Neovim's built-in formatter. LazyVim normally routes `gq`
-- through its formatter integration, which is not a paragraph wrapper.
vim.opt.textwidth = 80
vim.opt.formatexpr = ""

-- `textwidth` should affect an explicit `gq`, not wrap lines as we type.
-- `formatoptions` is buffer-local and filetypes may alter it, so enforce this
-- after the buffer is entered as well.
local no_auto_wrap = vim.api.nvim_create_augroup("no_auto_wrap", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = no_auto_wrap,
  callback = function()
    vim.opt_local.formatoptions:remove("t")
  end,
})

-- Show Markdown markup such as **bold**, backticks, and link targets.
-- LazyVim's built-in <leader>uc mapping can still toggle concealment on.
vim.opt.conceallevel = 0
