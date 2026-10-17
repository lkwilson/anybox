# tmux workspace helpers

The Bash library defines `t` and `tt` when `tmux` is installed.
Nested workspace IDs are stable hashes of the current directory:

```text
ws-tt-<first 12 characters of shasum($PWD)>
```

The directory string is hashed as-is. Paths that resolve to the same location
but spell `$PWD` differently, such as a symlinked path, receive different IDs.

## Server layout

Normal workspaces are windows in tmux's ordinary `default` server.

Nested workspaces are sessions in one separate `ws` server:

```text
ws:ws-tt-<directory-hash>
```

The separate `ws` server is what makes `tt` a real nested tmux: running a
session command against the default server from a default-server pane would
only control the outer tmux, not open an inner client.

The default server also provides these prefix-free bindings:

| Keys | Action |
| --- | --- |
| `C-j` / `C-k` | Next / previous outer window |
| `C-_` (usually `C-/`) | Toggle between pane 0 zoomed and the two-pane layout, focusing pane 1 when restoring. |

## `t`: attach or start

`t` is an alias for `tmux attach || tmux`. Use it outside tmux to attach to an
existing session or start one if attaching fails.

## `jt` and `jw`: shell home

Each Bash shell saves its starting directory in `_term_start_dir`. `jt` resets
that variable to `$PWD`; `jw` changes back to it. These work inside and outside
tmux, with no workspace lookup or pane metadata.

A typical workspace starts with `C-b c`, then `cd ~/src/project; jt`.
Use `C-b w` to choose an outer window.

In both configs, `C-b c`, `C-b "`, and `C-b %` create windows or splits in the
active pane's current directory. The new shell saves that starting directory
as its own `jw` home; it does not copy the parent shell's saved home. Run `jw`
before splitting if you want the saved home rather than a directory you visited.

## `tt`: nested workspace

`tt` opens an isolated nested tmux client for `$PWD`:

```sh
tmux -L ws -f "$HOME/.config/tmux/tmux-inner.conf" \
  new-session -A -s "ws-tt-<directory-hash>"
```

All nested workspaces share the `ws` server but have separate sessions, so their
windows and panes remain independent. The inner configuration enables mouse
support and prefix (`C-b`) pane navigation with `h`, `j`, `k`, and `l`. It also
provides prefix-free window cycling:

| Keys | Action |
| --- | --- |
| `C-h` | Previous window |
| `C-l` | Next window |

These are generally for running terminals in a split pane, while nvim runs in
the primary. `C-/` is used to toggle the terminal, and `C-h/l` switches between
terminals. Outer tmux leaves `C-h/l` to applications and handles `C-j/k` even
while inside `tt`. Use Enter to submit shell commands instead of `C-j`.
Use `C-b C-b c` to create an inner terminal; doubled prefixes also reach inner
pane bindings. `tmux.conf` and `tmux-inner.conf` both load `tmux-core.conf` for
the shared settings. Use `C-w h/j/k/l` to navigate Neovim splits.

## Mouse and clipboard

Mouse support is enabled so the wheel enters tmux copy mode for scrollback.
The shared configuration sets `escape-time` to `0`, so tmux does not delay a
standalone Escape key while waiting to see whether it starts a terminal escape
sequence.
This configuration uses tmux's default emacs-style copy-mode bindings:

```text
C-b [  enter copy mode
Space  begin selection
Enter  copy and exit
```

The outer/default and nested `ws` servers use `set-clipboard on`, allowing
clipboard requests from pane applications to reach Kitty. This lets Neovim's
OSC 52 provider copy yanks to the local clipboard when Neovim runs over SSH.
Both servers enable `allow-passthrough on`, which lets the Bash `clip` helper's
tmux-wrapped OSC 52 sequence reach Kitty, including over SSH.

Kitty accepts clipboard writes and is configured with `no-append`, so each copy
replaces the system clipboard rather than appending to it. Because the outer
server accepts clipboard requests, commands run in it—including remote commands
over SSH—can write the local clipboard.
