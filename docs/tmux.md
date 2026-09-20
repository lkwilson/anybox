# tmux workspace helpers

The Bash library defines `th` and `tt` when `tmux` is installed. Both derive a
stable workspace ID from the current directory:

```text
ws-<first 12 characters of shasum($PWD)>
```

The directory string is hashed as-is, so paths that resolve to the same
location but have a different `$PWD` spelling (such as a symlinked path)
receive different IDs.

## `th`: normal tmux workspace

Outside tmux, `th` runs:

```sh
tmux -L default new-session -A -s "$workspace_id"
```

Every `th` operation explicitly targets tmux's `default` server. `-A` means
attach when the named session already exists; otherwise, create it.

Inside tmux, `th` instead creates the named session detached when necessary,
switches the current client to it, then closes the pane from which it was run.
If that pane was the window's only pane, tmux also removes the now-empty window.
Running `th` while already in the destination session is a no-op. This avoids
nesting a tmux client inside another tmux client.

Inside a `tt` server, its socket is not named `default`. In that case `th`
creates the workspace detached on tmux's explicit `default` socket and returns
to the inner shell; it neither switches the inner client nor closes its pane.
This supports the staging flow: create an inner window, `cd` to a project, run
`th`, then detach or exit the inner tmux and select the staged default-server
workspace with `C-b w`. If the inner session has other windows, `exit` closes
only the staging window; use `C-b C-b d` to send `C-b d` to, and detach from,
the inner tmux.

Tmux documents `default` as the name of its default socket, and `-L default`
selects it regardless of the inner `$TMUX` value. This works for the default
server on the same host and user (using the same `TMUX_TMPDIR`, if set). It
intentionally does not target an outer server started with a custom `-L` name
or a custom `-S` socket path.

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
