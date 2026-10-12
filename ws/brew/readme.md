# Homebrew packages

Current inventory of formulae installed on request and installed casks. Formula
packages installed only as dependencies are omitted; Homebrew manages those as
needed. `npm` is included with `node`, `redis-cli` with `redis`, while `rustup`
manages Rust toolchains.

## Dev tools

The baseline developer tools to have on both macOS and Linux.

```sh
brew install \
  fd \
  fzf \
  gh \
  git \
  git-filter-repo \
  jq \
  lazygit \
  neovim \
  perl \
  ripgrep \
  tea \
  yq
```

## Language toolchains and runtimes

`rustup` manages Rust and Cargo, `uv` manages Python tooling, and `node` includes
`npm`.

```sh
brew install \
  node \
  rustup \
  uv
```

Homebrew exposes Rust commands through the rustup proxy directory. Add it to
your shell `PATH`, then select the stable toolchain (this downloads Rust and
Cargo on first use):

```sh
export PATH="$(brew --prefix rustup)/bin:$PATH"
rustup default stable
```

Put the `export PATH=...` line in your shell startup configuration to keep it
available in new terminals. Verify setup with `rustc --version` and
`cargo --version`. The repository's Bash config already loads `~/.cargo/env`
when present.

## Other shared tools

These command-line, media, and cluster tools are useful on both macOS and Linux.

```sh
brew install \
  aom \
  argocd \
  btop \
  derailed/k9s/k9s \
  fastfetch \
  ffmpeg \
  fluxcd/tap/flux \
  gnupg \
  helm \
  htop \
  jpeg-xl \
  kubernetes-cli \
  kustomize \
  kubeseal \
  libass \
  librist \
  luarocks \
  nmap \
  redis \
  restic \
  srt \
  swig \
  tesseract \
  unbound
```

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
