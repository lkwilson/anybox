# Neovim

LazyVim with the Kanagawa Wave theme. Formatting on save is off by default;
other editing behavior uses LazyVim defaults.
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
| `gq{motion}` | Stock: use the configured formatter. For prose wrapping, use `gw{motion}` instead. |
| `gwap` | Wrap a paragraph: `gw` (built-in formatting) + `ap` (a paragraph). Visual selection then `gw` wraps selected prose. |
| `Ctrl-Space` (Insert) | Open completion manually; stock also opens it while typing. |
| `Ctrl-n` / `Ctrl-p` (Insert) | Select next / previous completion. |
| Enter / `Ctrl-y` (Insert) | Accept a completion. Stock preselects an item, so Enter can accept immediately. |
| `Ctrl-e` (Insert) | Cancel completion and undo its inserted preview. Space is not an accept key. |
| `Space c f` | Format the buffer now, or the selection in Visual mode. |
| `Space u F` | Toggle format-on-save for this buffer. |
| `Space u f` | Toggle format-on-save globally for this session. Stock starts on; this config starts off. |
| `:LazyFormatInfo` | Show the current buffer's formatters and whether autoformat is enabled. |
| `Space u c` | Toggle concealment. Turn it off to show Markdown markup such as backticks and link targets. |
| `:set filetype=bash` | Set the buffer's filetype. |

Enable formatting on save with `Space u F` for a buffer or `Space u f` for the
session. It runs when a formatter is available and can change the whole file.
Buffer settings override the global setting. Use `:LazyFormatInfo` to check
whether it is enabled for the current buffer.

Prose wrapping uses Neovim's built-in formatter and the buffer's `textwidth`.
Set an explicit width with `:setlocal textwidth=80`. At zero, the target is the
window width capped at 79 columns. Filetype settings and EditorConfig can
affect wrapping while typing.

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
