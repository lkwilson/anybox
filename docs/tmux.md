# tmux workspace helpers

The Bash library defines `ta`, `th`, and `tt` when `tmux` is installed.
Workspace IDs are stable hashes of the current directory:

```text
ws-<first 12 characters of shasum($PWD)>
```

The directory string is hashed as-is. Paths that resolve to the same location
but spell `$PWD` differently, such as a symlinked path, receive different IDs.

## Server layout

Normal workspaces are sessions in tmux's ordinary `default` server:

```text
default:ws-<directory-hash>
```

Nested workspaces are sessions in one separate `ws` server:

```text
ws:ws-tt-<directory-hash>
```

The separate `ws` server is what makes `tt` a real nested tmux: running a
session command against the default server from a default-server pane would
only control the outer tmux, not open an inner client.

The default server also provides this prefix-free binding:

| Keys | Action |
| --- | --- |
| `C-_` (usually `C-/`) | Toggle between pane 0 zoomed and the two-pane layout, focusing pane 1 when restoring. |

## `ta`: attach

`ta` refuses to run inside tmux. Outside tmux, it attaches to a session in the
default server; if that fails, it tries the `ws` server:

```sh
tmux attach || tmux -L ws attach
```

## `th`: normal workspace

`th` opens the normal workspace for `$PWD` in the default server.

| Starting position | `th` behavior |
| --- | --- |
| Not in tmux | Attach to `default:ws-<hash>`, creating it when absent. |
| In `default`, already in that session | Do nothing. |
| In `default`, in another session | Create `default:ws-<hash>` detached when absent, then switch this client to it. |
| In another server, including `ws` from `tt` | Create `default:ws-<hash>` detached when absent, then remain in the current server. |

Each workspace is its own session, and you can run multiple terminals or switch
between them from one terminal.

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
terminals.

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

The outer/default server uses `set-clipboard on`, allowing it to forward a
nested `tt` server's OSC 52 clipboard request to Kitty. The nested `ws` server
uses `set-clipboard external`, so its copy-mode selections can be forwarded
without allowing programs in its panes to request clipboard writes directly.
Both servers enable `allow-passthrough on`, which lets the Bash `clip` helper's
tmux-wrapped OSC 52 sequence reach Kitty, including over SSH.

Kitty accepts clipboard writes and is configured with `no-append`, so each copy
replaces the system clipboard rather than appending to it. Because the outer
server accepts clipboard requests, commands run in it—including remote commands
over SSH—can write the local clipboard.
