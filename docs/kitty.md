# Kitty

Kitty follows macOS appearance using `dark-theme.auto.conf` (Kanagawa Dragon)
and `light-theme.auto.conf` (Kanagawa Lotus). These are Kitty's automatic theme
filenames, so `kitty.conf` does not need an explicit theme include.

The palettes come from [Kanagawa's Kitty themes](https://github.com/rebelot/kanagawa.nvim/tree/master/extras/kitty).
Window borders and search marks use matching accents. Palette files contain
only colours; font, opacity, window sizing, and clipboard settings remain in
`kitty.conf`. Tmux and Neovim also use Dragon/Lotus and follow the terminal's
reported appearance.

Edit the files under `skel/.config/kitty/` and apply them through the normal
dotfile review workflow. In Kitty, `Ctrl-Shift-F5` reloads configuration;
macOS appearance changes select the corresponding automatic palette.
