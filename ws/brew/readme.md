# Homebrew packages

Current inventory of formulae installed on request and installed casks. Formula
packages installed only as dependencies are omitted; Homebrew manages those as
needed. `npm` is included with `node`, `redis-cli` with `redis`, while `rustup`
manages Rust toolchains.

## Update casks

```sh
brew update
brew outdated --cask
brew upgrade --cask
```

## Dev tools

The baseline developer tools to have on both macOS and Linux.

```sh
brew install \
  fd \
  fzf \
  git \
  git-filter-repo \
  jq \
  lazygit \
  luarocks \
  neovim \
  perl \
  ripgrep \
  swig \
  yq
```

### Extra

```sh
brew install \
  bash-completion@2 \
  btop \
  fastfetch \
  gnupg \
  htop \
  watch \
  wget
```

### Optional

```sh
brew install \
  tea \
  gh \
  nmap \
  redis \
  unbound \
  restic
```

```sh
brew install --cask \
  claude-code \
  codex
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

## Kubernetes tools

```sh
brew install \
  k9s \
  fluxcd/tap/flux \
  helm \
  kubernetes-cli \
  kustomize
  # argocd \
  # kubeseal
```

## Media and document tools

```sh
brew install \
  aom \
  ffmpeg \
  jpeg-xl \
  libass \
  librist \
  srt \
  tesseract
```

## macOS

These are Mac-specific utilities or applications in this inventory.

```sh
brew install \
  iproute2mac
brew install --cask \
  karabiner-elements \
  linearmouse \
  kitty
```

### Extras

Linux utilities and system tools that may need explicit installation on macOS.

```sh
brew install \
  bash \
  coreutils \
  gnu-tar \
  rsync \
  tmux \
  vim
```
