# Homebrew packages

Current inventory of formulae installed on request and installed casks. Formula
packages installed only as dependencies are omitted; Homebrew manages those as
needed. `npm` is included with `node`, `redis-cli` with `redis`, while `rustup`
manages Rust toolchains.

## Shared Homebrew formulae

Command-line, development, media, and cluster tools that are useful on both
macOS and Linux. This is the portable tool set; it does not imply every package
is installed on every machine.

```sh
brew install \
  aom \
  argocd \
  btop \
  derailed/k9s/k9s \
  fastfetch \
  fd \
  ffmpeg \
  fluxcd/tap/flux \
  fzf \
  gh \
  git \
  git-filter-repo \
  gnupg \
  helm \
  htop \
  jpeg-xl \
  jq \
  kubernetes-cli \
  kustomize \
  kubeseal \
  lazygit \
  libass \
  librist \
  luarocks \
  neovim \
  nmap \
  node \
  perl \
  redis \
  restic \
  ripgrep \
  rustup \
  srt \
  swig \
  tea \
  tesseract \
  unbound \
  uv \
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

## System-dependent tools

These utilities are common across platforms, but their source or behavior can
depend on the operating system. On macOS, install the Homebrew versions below
when needed. On Linux, the distribution packages are usually the natural choice;
Homebrew on Linux is optional.

```sh
brew install \
  bash \
  bash-completion \
  coreutils \
  gnu-tar \
  rsync \
  tmux \
  vim \
  watch \
  wget
```

## macOS tools

These are Mac-specific utilities or applications in this inventory.

```sh
brew install \
  iproute2mac
brew install --cask \
  karabiner-elements \
  linearmouse \
  kitty \
  claude-code \
  codex
```

## Linux tools

No Linux-only packages are listed in this Homebrew inventory. Use the Linux
distribution's package manager for system-dependent tools above, and install
shared tools with Homebrew on Linux where that is preferred and supported.

## Update casks

```sh
brew update
brew outdated --cask
brew upgrade --cask
```

## Project-specific dependencies

```sh
brew install \
  openssl@1.1 \
  openssl@4
```
