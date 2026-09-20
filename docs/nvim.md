# Neovim

All keys below are for Normal mode. `<leader>` is `Space`.

## Defaults

| Keys | Action |
| --- | --- |
| `<leader>e` | Toggle file explorer |
| `<leader>cf` | Format current buffer manually |
| `<leader>uf` | Toggle format-on-save |
| `<leader>uc` | Toggle concealment (for example, Markdown markup) |
| `<leader>qs` | Restore the current directory's session |
| `<leader>ql` | Restore the last session |
| `<C-w>` | Window-command prefix |

In the explorer, `<M-p>` toggles its preview pane and `?` shows its help.

## Overrides

| Keys | Action |
| --- | --- |
| `<C-h>` | Previous buffer |
| `<C-l>` | Next buffer |
| `<leader>bd` | Close current buffer (`:bd`) |
| `<C-w>` | Close current buffer (alias for `<leader>bd`) |
| `<leader>w` | Close all buffers |

- Format-on-save is disabled by default.
- `gq` wraps selected prose at 80 columns; it does not invoke an external formatter.
