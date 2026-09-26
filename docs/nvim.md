# Neovim

Keys are for Normal mode unless noted. `<leader>` is `Space`.

## Stock LazyVim

| Keys | Action |
| --- | --- |
| `<leader>e` | Open the file explorer |
| `H` / `I` in the explorer | Toggle hidden / ignored files |
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
| File visibility | Explorer and file picker include hidden and ignored files. Grep includes hidden files but excludes ignored files by default. See visibility toggles below. |
| Completion settings (Insert mode) | Open the menu manually with `<C-Space>`; no preselection or inserted previews. Select with `<C-n>` / `<C-p>`, accept with Enter or `<C-y>`. Space does not accept. Command-line completion remains stock. |
| Format settings | Format-on-save is off to avoid unrelated changes when editing existing files. `<leader>cf` explicitly formats; `gq` retains stock formatter integration. |
| Theme | Kanagawa Wave (`kanagawa-wave`) replaces stock Tokyo Night, selected through LazyVim's colorscheme option. |

There is no global wrapping override. `gw` uses the buffer's `textwidth`;
when it is zero, the target is the window width capped at 79 columns.
For an explicit 80-column prose wrap, use `:setlocal textwidth=80` first.
Filetype settings and EditorConfig may set a different width or enable wrapping.

## Finding hidden or ignored files

Hidden means a dot-prefixed name, even if Git tracks it. Ignored means excluded
by ignore rules. The two filters are independent.

| Where | Toggle hidden | Toggle ignored |
| --- | --- | --- |
| Explorer (`<leader>e`) | `H` (Shift-H) | `I` (Shift-I) |
| File picker (`<leader><leader>`) or grep (`<leader>sg`) | `Alt-h` | `Alt-i` |

Picker shortcuts work while typing in the search input and in Normal mode.
On macOS, Alt is Option; the terminal must send it as Alt/Meta.
For a missing result, toggle the relevant filter and search again. These are
interactive toggles, not saved per-repository preferences.

For a recurring project exception, lazy.nvim also supports a `.lazy.lua` file
containing plugin specs, merged after the main config. It searches upward from
Neovim's startup working directory and loads the nearest file after a trust
prompt. Start Neovim inside that repository; changing directories later does
not automatically switch project specs. Prefer the visibility toggles for
occasional exceptions. See [lazy.nvim configuration](https://lazy.folke.io/configuration).
