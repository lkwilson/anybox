vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
vim.opt.nu = true
-- vim.opt.relativenumber = true
vim.opt.scrolloff = 3

-- white space
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- searches
-- preview searches live
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.keymap.set('n', '<leader><leader>', '<cmd>nohlsearch<CR>')
vim.opt.incsearch = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- persistence
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('i', '<C-h>', '<Esc><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('i', '<C-l>', '<Esc><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('i', '<C-j>', '<Esc><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('i', '<C-k>', '<Esc><C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })

-- terminal
vim.keymap.set('n', '<leader>t', function()
  vim.cmd("terminal")
  vim.cmd("startinsert")
end)
vim.keymap.set('n', '<leader>nt', function()
  vim.cmd("split | terminal")
  vim.cmd("startinsert")
end)
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*",
  callback = function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
  end,
})

-- colors
if os.getenv('COLORTERM') == 'truecolor' then
  vim.opt.termguicolors = true
end

-- keys
vim.opt.updatetime = 50

-- mappings
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>l', ":vsplit<CR>")
vim.keymap.set('n', '<leader>h', ":vsplit<CR>")
vim.keymap.set('n', '<leader>j', ":split<CR>")
vim.keymap.set('n', '<leader>k', ":split<CR>")
vim.keymap.set('n', '<leader>s', ":w<CR>")
vim.keymap.set('n', '<leader>w', ":q<CR>")
vim.keymap.set('n', '<leader>q', ":qa<CR>")

-- use extras?
-- require('extra.init')

