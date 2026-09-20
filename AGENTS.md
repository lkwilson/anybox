# anybox agent guide

This repository manages the user's dotfiles. The repository is the desired
state; the live files in `$HOME` are production state and are not an editing
target.

## Editing workflow

- When the user asks to make dotfile edits, edit the corresponding file under
  `./skel/` (for example, `./skel/.config/tmux/tmux.conf`).
- Do **not** edit live dotfiles such as `~/.config/tmux/tmux.conf`. The user
  reviews repository changes and applies them separately.
- Before or after an edit, `./ab d` is safe to run. It shows the diff between
  `./skel` and the live files.
- Never run `./ab i` (install) or `./ab c` (capture). `i` writes the
  repository state to live dotfiles; `c` overwrites repository files with live
  state. Both bypass the user's audit step.

## Scope

Run `./ab` from this repository root. It defaults to `./skel`; optional module
arguments target `./ws/<module>/skel`.
