# Neovim

All keys are for Normal mode. `<leader>` is `Space`.

## Stock LazyVim

| Keys | Action |
| --- | --- |
| `<leader>e` | Open the file explorer |
| `H` / `I` in the explorer | Show hidden / ignored files |
| `?` in the explorer | Show explorer help |
| `[b` / `]b` | Previous / next buffer |
| `<leader>bd` / `<leader>bo` | Close current buffer / all other buffers |
| `<C-w>` then a command | Window commands, e.g. `<C-w>h` moves left |
| `<leader>cf` | Format now |
| `<leader>uf` | Toggle format-on-save |
| `<leader>qs` / `<leader>ql` | Restore this project's session / the last session |
| `s` | Jump with Flash |
| `<leader>uc` | Show Markdown markup by turning concealment off |
| `<leader>sg` | Grep the project root |
| `:set filetype=bash` | Set the current buffer's filetype |

## This configuration: delta

| Keys / setting | Effect compared with stock LazyVim |
| --- | --- |
| `<C-h>` / `<C-l>` | Previous / next buffer; stock uses `[b` / `]b` |
| Explorer, file picker, and grep settings | Hidden and ignored files are always included; stock toggles: `H` / `I` in explorer, `<M-h>` / `<M-i>` in picker |
| Completion settings | Completion opens only with `<C-Space>`; stock opens it while typing |
| `s` | Neovim one-character substitute; stock starts a Flash jump |
| Format settings | Format-on-save is off; the editor never auto-wraps while typing, even past 80 columns; format manually with `<leader>cf` |
| `gq` | Explicitly wrap selected prose at 80 columns without an external formatter |
| Markdown settings | Markup is always shown; stock uses `<leader>uc` to turn concealment off |
| Auto-pairs | Disabled; typing `"` inserts one quote, while stock automatically inserts the closing quote |
| Mini.ai text objects | Disabled; stock `a` / `i` text objects retain Neovim's built-in behavior |
