# Neovim

Keys are for Normal mode unless noted. `<leader>` is `Space`.

## Stock LazyVim

| Keys | Action |
| --- | --- |
| `<leader>e` | Open the file explorer |
| `H` / `I` in the explorer | Show hidden / ignored files |
| `?` in the explorer | Show explorer help |
| `H` / `L` (Shift-H / Shift-L), or `[b` / `]b` | Previous / next buffer |
| `<leader>bd` / `<leader>bo` | Close current buffer / all other buffers |
| `<C-w>` then a command | Window commands, e.g. `<C-w>h` moves left |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move between windows |
| `<leader>cf` | Format now |
| `<leader>uf` | Toggle format-on-save |
| `gwap`, or Visual selection then `gw` | Wrap prose using Neovim's built-in formatter, bypassing external formatters |
| `<leader>qs` / `<leader>ql` | Restore this project's session / the last session |
| `s` | Jump with Flash |
| `cl` | Change one character (the built-in equivalent of `s`) |
| `<leader>uc` | Show Markdown markup by turning concealment off |
| `<leader>sg` | Grep the project root |
| `<leader><leader>` | Find files in the project root |
| `:set filetype=bash` | Set the current buffer's filetype |

## This configuration: delta

| Keys / setting | Effect compared with stock LazyVim |
| --- | --- |
| Explorer, file picker, and grep settings | Include hidden files and files excluded by ignore rules by default; toggle with `H` / `I` in explorer, `<M-h>` / `<M-i>` in picker. This can include generated files and dependencies. |
| Completion settings (Insert mode) | Open the menu manually with `<C-Space>`; no preselection or inserted previews. Select with `<C-n>` / `<C-p>`, accept with Enter or `<C-y>`. Space does not accept. Command-line completion remains stock. |
| Format settings | Format-on-save is off to avoid unrelated changes when editing existing files. `<leader>cf` explicitly formats; `gq` retains stock formatter integration. |
| Theme | Code 2026 (`dark-2026`) replaces stock Tokyo Night. |
| Auto-pairs | Disabled; typing `"` inserts one quote, while stock automatically inserts the closing quote |

There is no global wrapping override. `gw` uses the buffer's `textwidth`;
when it is zero, the target is the window width capped at 79 columns.
For an explicit 80-column prose wrap, use `:setlocal textwidth=80` first.
Filetype settings and EditorConfig may set a different width or enable wrapping.
