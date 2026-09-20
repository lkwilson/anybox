-- Restore Neovim's built-in `s` command (substitute one character). LazyVim
-- otherwise assigns it to Flash's jump interface in normal, visual, and
-- operator-pending modes.
return {
  {
    "folke/flash.nvim",
    keys = {
      { "s", false, mode = { "n", "x", "o" } },
    },
  },
}
