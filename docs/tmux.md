# tmux workspace helpers

The Bash library defines `th` and `tt` when `tmux` is installed. Both derive a
stable workspace ID from the current directory:

```text
ws-<first 12 characters of shasum($PWD)>
```

Running either helper again from the same `$PWD` reconnects to its existing
workspace. A different directory gets a different workspace. The directory
string is hashed as-is, so paths that resolve to the same location but have a
different `$PWD` spelling (such as a symlinked path) receive different IDs.

## `th`: normal tmux workspace

`th` runs:

```sh
tmux new-session -A -s "$workspace_id"
```

It uses tmux's default server. `-A` means attach when the named session already
exists; otherwise, create it. Use `th` for a reusable, per-directory session
that participates in your regular tmux server alongside other normal tmux
sessions.

## `tt`: isolated inner workspace

`tt` runs:

```sh
tmux -L "$workspace_id" -f "$HOME/.config/tmux/tmux-inner.conf" \
  new-session -A -s ws
```

`-L` gives tmux a separate server socket named for the directory-derived ID, so
this workspace is isolated from the default server and from `tt` workspaces for
other directories. Within that private server the session is always named
`ws`; `-A` still reattaches when it already exists.

The inner configuration loads `tmux-core.conf`, which enables mouse support and
prefix (`C-b`) pane navigation with `h`, `j`, `k`, and `l`. It also adds
prefix-free window cycling:

| Keys | Action |
| --- | --- |
| `C-h` | Previous window |
| `C-l` | Next window |

This separation makes `tt` useful as an inner tmux instance, including when it
is launched from another tmux session, without sharing that outer server's
sessions or socket.
