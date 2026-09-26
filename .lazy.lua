-- Project file visibility. Copy this file to another repo and edit each source.
-- hidden: true shows dotfiles; false hides them.
-- ignored: true shows files excluded by ignore rules; false hides them.
-- exclude: omit matching files/directories, even when hidden/ignored are shown.
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
            exclude = {}, -- e.g. { ".git", "node_modules" }
          },
          files = {
            hidden = true,
            ignored = false,
            exclude = {}, -- e.g. { "build", "dist" }
          },
          grep = {
            hidden = true,
            ignored = false,
            exclude = {
              -- "build",
              -- "dist",
              -- "node_modules",
              -- "*.min.js",
            },
          },
        },
      },
    },
  },
}
