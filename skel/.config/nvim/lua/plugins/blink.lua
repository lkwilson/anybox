-- Keep completion available on demand (<C-Space>), without popping up while
-- typing. This merges with LazyVim's default blink.cmp configuration.
return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = { auto_show = false },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
    },
  },
}
