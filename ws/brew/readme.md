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
  ast-grep \
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

### Linux-only dev tools

```sh
brew install \
  bubblewrap
```

#### Debian Codex sandbox

On Debian (including the Raspberry Pi at `cm7.lan`), use the distribution
package instead of Homebrew's Bubblewrap:

```sh
sudo apt update
sudo apt install bubblewrap
```

Debian normally needs no additional AppArmor setup. Keep `/usr/bin` before
Homebrew's bin directory on `PATH` when starting Codex; `command -v bwrap`
should return `/usr/bin/bwrap`.

As your normal user, check that Bubblewrap can create user and network
namespaces:

```sh
/usr/bin/bwrap --unshare-user --unshare-net --ro-bind / / /bin/true
```

No output and exit status `0` means the basic namespace check passed. Restart
Codex after installation. If the check fails, inspect the error before
changing kernel or AppArmor settings.

#### Ubuntu 24.04 Codex sandbox

Codex needs Bubblewrap to create user and network namespaces. On Ubuntu 24.04,
install Ubuntu's package and load its AppArmor profile:

```sh
sudo apt install bubblewrap apparmor-profiles apparmor-utils
sudo install -m 0644 \
  /usr/share/apparmor/extra-profiles/bwrap-userns-restrict \
  /etc/apparmor.d/bwrap-userns-restrict
sudo apparmor_parser -r /etc/apparmor.d/bwrap-userns-restrict
```

Keep `/usr/bin` before Homebrew's bin directory on `PATH` when starting Codex,
so it uses Ubuntu's `bwrap` and not Homebrew's copy.

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

## WSL

`wslview` is provided by Ubuntu's `wslu` package, rather than Homebrew:

```sh
sudo apt install wslu
```
