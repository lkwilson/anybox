return {
  {
    "code-2026-theme/nvim",
    name = "code-2026",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("code-2026").setup(opts)
      vim.cmd.colorscheme("dark-2026")
    end,
  },
}
