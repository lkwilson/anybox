# Homebrew packages

Starting inventory captured from the current Homebrew installation. Formula
packages installed as dependencies are omitted; Homebrew manages those as needed.

## Shared tools

These are general command-line, development, media, or cluster tools that can
be useful on both macOS and Linux.

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

`kitty` is also installed as a cask; it is a terminal emulator available on
multiple platforms, so it is listed separately from macOS-only tools.

```sh
brew install --cask kitty
```

## Linux tools

No Linux-specific packages were identified in the current inventory. The shared
tools above can also be installed with Homebrew on Linux where supported.

## Project-specific dependencies

OpenSSL 1.1 appears to be for a project rather than a general-purpose tool.

```sh
brew install openssl@1.1
```
