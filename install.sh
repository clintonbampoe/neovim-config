#!/usr/bin/env bash
# install.sh - system dependencies for forge-nvim
# Installs: Neovim (latest), clang, cmake, .NET SDK, ripgrep, lazygit,
#           stow, curl, git, build-essential

set -uo pipefail

# ---- colors ----
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[1;33m'
C_BLUE='\033[0;34m'
export C_BOLD='\033[1m'

log_info() { echo -e "${C_BLUE}[forge-nvim]${C_RESET} $*"; }
log_ok() { echo -e "${C_GREEN}[forge-nvim] ✓${C_RESET} $*"; }
log_warn() { echo -e "${C_YELLOW}[forge-nvim] !${C_RESET} $*"; }
log_error() { echo -e "${C_RED}[forge-nvim] ✗${C_RESET} $*" >&2; }

# ---- helpers ---------------------------------------------------------------

is_installed() { command -v "$1" >/dev/null 2>&1; }

apt_install() {
    log_info "Installing $* via apt..."
    sudo apt-get install -y "$@"
    log_ok "$* installed."
}

# ---- base tools ------------------------------------------------------------

log_info "Updating package list..."
sudo apt-get update -q

for pkg in curl git stow build-essential; do
    if ! is_installed "$pkg"; then
        apt_install "$pkg"
    else
        log_ok "$pkg already installed, skipping."
    fi
done

# ---- Neovim (latest AppImage from GitHub releases) -------------------------
# Debian repos lag behind. This always gets the latest stable binary.

if ! is_installed nvim; then
    log_info "Installing Neovim (latest stable AppImage)..."

    NVIM_URL="$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest |
        grep -o '"browser_download_url": *"[^"]*nvim-linux-x86_64\.appimage"' |
        grep -o 'https://[^"]*')"

    [[ -z "$NVIM_URL" ]] && {
        log_error "Could not fetch Neovim download URL."
        exit 1
    }

    curl -Lo /tmp/nvim.appimage "$NVIM_URL"
    chmod +x /tmp/nvim.appimage
    sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
    log_ok "Neovim $(nvim --version | head -1) installed."
else
    log_ok "Neovim already installed ($(nvim --version | head -1)), skipping."
fi

# ---- C/C++ toolchain -------------------------------------------------------

for pkg in clang clangd clang-format cmake; do
    if ! is_installed "$pkg"; then
        apt_install "$pkg"
    else
        log_ok "$pkg already installed, skipping."
    fi
done

# ---- ripgrep (Telescope live grep) -----------------------------------------

if ! is_installed rg; then
    apt_install ripgrep
else
    log_ok "ripgrep already installed, skipping."
fi

# ---- .NET SDK (latest via Microsoft feed) ----------------------------------
# Debian repos have outdated .NET versions. Use the official Microsoft script.

if ! is_installed dotnet; then
    log_info "Installing .NET SDK..."

    curl -Lo /tmp/dotnet-install.sh https://dot.net/v1/dotnet-install.sh
    chmod +x /tmp/dotnet-install.sh
    /tmp/dotnet-install.sh --channel LTS
    rm /tmp/dotnet-install.sh

    # Add dotnet to PATH for the current session and persist it
    export PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"

    SHELL_RC="$HOME/.bashrc"
    if ! grep -q '.dotnet' "$SHELL_RC" 2>/dev/null; then
        echo 'export PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"' >>"$SHELL_RC"
    fi

    log_ok ".NET SDK $(dotnet --version) installed."
else
    log_ok ".NET SDK already installed ($(dotnet --version)), skipping."
fi

# ---- LazyGit (latest binary from GitHub releases) --------------------------
# apt version lags behind significantly.

if ! is_installed lazygit; then
    log_info "Installing LazyGit (latest)..."

    LAZYGIT_VERSION="$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest |
        grep -o '"tag_name": *"[^"]*"' |
        grep -o 'v[^"]*')"

    [[ -z "$LAZYGIT_VERSION" ]] && {
        log_error "Could not fetch LazyGit version."
        exit 1
    }

    curl -Lo /tmp/lazygit.tar.gz \
        "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz"

    tar -xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo mv /tmp/lazygit /usr/local/bin/lazygit
    rm /tmp/lazygit.tar.gz
    log_ok "LazyGit $LAZYGIT_VERSION installed."
else
    log_ok "LazyGit already installed, skipping."
fi

# ---- node (bash-language-server needs it) ----------------------------------

if ! is_installed node; then
    log_info "Installing Node.js via NodeSource (LTS)..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    apt_install nodejs
    log_ok "Node.js $(node --version) installed."
else
    log_ok "Node.js already installed ($(node --version)), skipping."
fi

# ---- done ------------------------------------------------------------------

echo
log_ok "All dependencies installed."
log_info "Open Neovim and run :Lazy sync to install plugins."
log_info "Mason will install LSP servers and formatters automatically on first launch."
