# tmux workspace helpers

The Bash library defines `ta`, `th`, and `tt` when `tmux` is installed. `th`
and `tt` derive a
stable workspace ID from the current directory:

```text
ws-<first 12 characters of shasum($PWD)>
```

The directory string is hashed as-is, so paths that resolve to the same
location but have a different `$PWD` spelling (such as a symlinked path)
receive different IDs.

`th` allows you to open tmux in the `ws` socket. If you're in a session within
the `ws` socket, then, it will automatically switch to the session, creating it
if needed. This is similar to vs code's auto open and switch to existing
instance behavior.

`tt` doesn't require `th`, and from tmux sessions, it can create a nested tmux
session with extra `C-l/h` bindings for quickly switching between windows,
useful for using nvim with a terminal split, especially within `ws` sockets.

`ta` attaches to the first session it finds among the named tmux server sockets:
it tries `default`, then `ws`, then every socket in shell glob order (and uses
tmux session-list order within each server). It refuses to run when already
inside tmux, preventing accidental nesting. If there are no sessions, it prints
an error and exits unsuccessfully.

## `th`: normal tmux workspace

Outside tmux, `th` runs:

```sh
tmux -L ws new-session -A -s "$workspace_id"
```

The canonical workspace is a **session** named `$workspace_id` in tmux's
`ws` server: `ws:$workspace_id`. `ws` is a dedicated server socket, separate
from tmux's ordinary `default` server. `tt` uses a different named server
socket only as an isolated staging environment.

### Starting-position contract

| Starting position | `th` behavior |
| --- | --- |
| Not in tmux | Attach to `ws:$workspace_id`, creating it when absent. |
| In `ws`, already in session `$workspace_id` | Do nothing. |
| In `ws`, in any other session | Create `ws:$workspace_id` detached when absent, then switch to it. To get back, you run `C-b w` and pick your old session. |
| In any non-`ws` tmux server, including `tt` | Create `ws:$workspace_id` detached when absent, then remain in the current server. A caller attached to `ws` can use `C-b w` to go to it. |

`thn` runs `th` and exits the current shell only after `th` succeeds.

### Multiple terminals

Multiple terminals may attach to the same `ws:$workspace_id` session; it
does not create a second server or prevent concurrent clients. They share the
same panes, windows, and programs, so two people—or two terminals—typing into
the same pane will affect the same process. Separate workspace sessions remain
independent, and switching sessions in one terminal switches only that tmux
client.

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
