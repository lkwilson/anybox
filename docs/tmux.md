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
tmux new-session -A -s "$workspace_id"
```

It uses tmux's default server. `-A` means attach when the named session already
exists; otherwise, create it.

Inside tmux, `th` instead creates the named session detached when necessary,
switches the current client to it, then closes the pane from which it was run.
If that pane was the window's only pane, tmux also removes the now-empty window.
Running `th` while already in the destination session is a no-op. This avoids
nesting a tmux client inside another tmux client.

`th` always uses the tmux server identified by its current `$TMUX` environment.
Therefore, from a regular tmux session it navigates regular-server workspaces;
> this is not what i want. tt should call back into default socket. is that
> fixed for every tmux install?
from inside `tt`, it creates and switches sessions inside that private inner
server.

## `thb`: create without switching

`thb` creates the same named workspace only when it is absent, and otherwise
does nothing. It does not attach or switch clients. Use `C-b s` to choose the
session directly, or `C-b w` to browse its windows.

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
