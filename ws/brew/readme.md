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

## macOS tools

```sh
brew install iproute2mac
brew install --cask linearmouse
```

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

## Project-specific dependencies

OpenSSL 1.1 appears to be for a project rather than a general-purpose tool.

```sh
brew install openssl@1.1
```
