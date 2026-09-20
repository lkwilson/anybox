-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Keep `gq` useful for prose: wrap an explicitly selected paragraph at 80
-- columns using Neovim's built-in formatter. LazyVim normally routes `gq`
-- through its formatter integration, which is not a paragraph wrapper.
vim.opt.textwidth = 80
vim.opt.formatexpr = ""

-- `textwidth` should affect an explicit `gq`, not wrap lines as we type.
vim.opt.formatoptions:remove("t")

-- Show Markdown markup such as **bold**, backticks, and link targets.
-- LazyVim's built-in <leader>uc mapping can still toggle concealment on.
vim.opt.conceallevel = 0
