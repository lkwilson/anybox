# Homebrew packages

Current inventory of formulae installed on request and installed casks. Formula
packages installed only as dependencies are omitted; Homebrew manages those as
needed. `npm` is included with `node`, while `rustup` manages Rust toolchains.

## Shared tools

General command-line, development, media, or cluster tools that are useful on
macOS and Linux.

```sh
brew install \
  aom \
  argocd \
  bash \
  bash-completion \
  btop \
  coreutils \
  derailed/k9s/k9s \
  fastfetch \
  fd \
  ffmpeg \
  fluxcd/tap/flux \
  fzf \
  gh \
  git \
  git-filter-repo \
  gnu-tar \
  gnupg \
  helm \
  htop \
  jpeg-xl \
  jq \
  kubernetes-cli \
  kubeseal \
  lazygit \
  libass \
  librist \
  luarocks \
  neovim \
  nmap \
  node \
  perl \
  ripgrep \
  rsync \
  rustup \
  srt \
  swig \
  tea \
  tesseract \
  tmux \
  unbound \
  uv \
  vim \
  watch \
  wget \
  yq
```

## Initialize Rust and Cargo

Homebrew installs `rustup`, but Cargo and the other Rust commands are exposed
through Homebrew's rustup proxy directory. Add it to your shell `PATH`, then
select the stable toolchain (this downloads Rust and Cargo on first use):

```sh
export PATH="$(brew --prefix rustup)/bin:$PATH"
rustup default stable
```

Put the `export PATH=...` line in your shell startup configuration to keep it
available in new terminals. Verify setup with `rustc --version` and
`cargo --version`. The repository's Bash config already loads `~/.cargo/env`
when present.

## macOS tools

```sh
brew install iproute2mac
brew install --cask \
  karabiner-elements \
  linearmouse
```

Karabiner-Elements also installs Karabiner-EventViewer. Back up
`~/.config/karabiner` before migrating an existing install. Avoid
`brew uninstall --cask --zap karabiner-elements`, which removes that settings
directory.

## Linux tools

No Linux-specific packages were identified in the current inventory. Shared tools
above can also be installed with Homebrew on Linux where supported.

## Cross-platform casks

```sh
brew install --cask \
  claude-code \
  codex \
  kitty
```

## Update casks

Refresh Homebrew's package data, see outdated casks, and update regular casks:

```sh
brew update
brew outdated --cask
brew upgrade --cask
```

Casks marked as auto-updating are skipped by the regular upgrade command. To
include those, such as LinearMouse, use:

```sh
brew outdated --cask --greedy-auto-updates
brew upgrade --cask --greedy-auto-updates
```

## Project-specific dependencies

OpenSSL 1.1 appears to be for a project rather than a general-purpose tool.

```sh
brew install openssl@1.1
```
