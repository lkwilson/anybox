# Neovim

LazyVim with the Kanagawa Wave theme. The Blink completion and Conform
formatting plugins are disabled; native completion and LSP formatting remain
available. Formatting on save starts off. Concealment is off, so Markdown
markup remains visible. The buffer tab bar stays visible even with only one
buffer open. Yanked text uses the system clipboard through OSC 52, which lets
Neovim running over SSH copy to the local terminal clipboard.
Keys below are for Normal mode unless noted. `Space` is the leader key;
uppercase letters mean Shift plus that letter. "Stock" means LazyVim, which
assigns some keys differently from bare Neovim.

## Find files and move around

| Keys | Meaning / context |
| --- | --- |
| `Space Space` | Find a file in the project root. |
| `Space s g` | Grep the project root. |
| `Space e` | Open the file explorer. |
| `H` / `I` in explorer | Toggle hidden / ignored files. These are separate filters. |
| `Alt-h` / `Alt-i` in picker | Toggle hidden / ignored files in file search or grep. |
| `?` in explorer | Show explorer help. |
| `H` / `L` | Previous / next buffer (Shift-H / Shift-L); `[b` / `]b` also work. |
| `Space b d` / `Space b o` | Close this buffer / all other buffers. |
| `Ctrl-h` / `Ctrl-j` / `Ctrl-k` / `Ctrl-l` | Move between windows: left / down / up / right. Use `H` / `L` for buffers. |
| `gd` | Go to definition through the attached language server. |
| `Ctrl-o` | Go back in the jump list after navigating. |
| `Space q s` / `Space q l` | Restore this project's session / the last session. |

Hidden files have dot-prefixed names, even when Git tracks them. Ignored files
match ignore rules. Toggle either filter again to hide those files. Picker
toggles work in the search input and in Normal mode; they are not saved as
per-repository preferences. In Windows Terminal, use left Alt without Shift.

## Edit and format

| Keys | Meaning / alternative |
| --- | --- |
| `s` | Stock: Flash jump. Type search text, then its label. For one-character substitute, use `cl`. |
| `cl` | Change one character, then enter Insert mode: `c` (change) + `l` (right). Same edit as bare Neovim's `s`. |
| `gq{motion}` | Format text using the buffer's formatting settings. |
| `gwap` | Wrap a paragraph with Neovim's built-in formatter; Visual selection then `gw` wraps selected text. |
| `Ctrl-n` / `Ctrl-p` (Insert) | Native keyword completion, next / previous match. |
| `Space c f` | Stock: request formatting using an available formatter, including LSP. |
| `Space u c` | Toggle concealment. It starts off, keeping Markdown markup visible. |
| `:set filetype=bash` | Set the buffer's filetype. |

This configuration does not override `formatexpr`, `formatprg`, `textwidth`,
or `formatoptions`; LazyVim, filetype settings, and LSP can still configure
formatting behavior. For built-in prose wrapping at a chosen width, use
`:setlocal textwidth=80` followed by `gwap`. Tree-sitter, LSP, and linting
remain enabled.

## Set file visibility for a repository

Save the [template below](#project-visibility-template) as `.lazy.lua` at a
repository root and edit
the `explorer`, `files`, and `grep` sections independently:

| Setting | Effect |
| --- | --- |
| `hidden = true` / `false` | Show / hide dotfiles and dot-prefixed directories. |
| `ignored = true` / `false` | Show / hide files excluded by ignore rules. |
| `exclude = { "build", "dist", "*.min.js" }` | Omit matching paths from that source. Use glob patterns without a leading `!`. |

To browse build output without searching its contents, leave `build` out of
the explorer/file-picker exclusions and put it in `grep.exclude`. If Git
ignores that directory, also set `ignored = true` for the sources that should
show it. A bare name such as `build` can match directories at any depth.
Exclusions still apply when you toggle hidden or ignored files on; remove
the exclusion to see those results. Grep also skips Git's internal `.git`
directory by default.

The template shows hidden files, respects ignore rules, and leaves the
exclusion lists empty with commented examples for you to customize.
To show everything except Git metadata, set `hidden = true`, `ignored = true`,
and `exclude = { ".git" }` in each source.

Start Neovim from inside the repository and allow `.lazy.lua` at the trust
prompt. Restart after editing it. lazy.nvim loads the nearest file found
above the startup working directory; its settings apply to that session.
Changing directories does not switch project settings, so start a separate
session for another repo. See [lazy.nvim project settings](https://lazy.folke.io/configuration).

For other commands, press `Space` and wait for the key hints, or consult the
[LazyVim keymap reference](https://www.lazyvim.org/keymaps).

### Project visibility template

Save this as `.lazy.lua` at a repository root:

```lua
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
```

## Occasional plain Vim use

Run `command vim` to bypass this shell config's `vim` alias to Neovim.
For two-space indentation in the current buffer:

```vim
:setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
```

`expandtab` inserts spaces when you press Tab; `softtabstop` controls Tab and
Backspace while editing, `shiftwidth` controls indentation, and `tabstop`
controls the displayed width of existing tab characters. This does not
convert existing tabs in the file. Makefile recipe indentation needs real tabs.
