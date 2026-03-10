#!/usr/bin/env bash
# @file scripts/setup-texlive.sh
# @brief Set up the recommended LaTeX environment on Ubuntu.

set -euo pipefail

readonly RECOMMENDED_FONT="haranoaji"

log() {
    echo "[INFO] $*"
}

warn() {
    echo "[WARN] $*" >&2
}

die() {
    echo "[ERROR] $*" >&2
    exit 1
}

require_command() {
    local cmd="$1"
    command -v "$cmd" >/dev/null 2>&1 || die "Required command not found: $cmd"
}

is_wsl() {
    grep -qi "microsoft" /proc/version 2>/dev/null
}

is_ubuntu() {
    [[ -f /etc/os-release ]] && grep -q '^ID=ubuntu' /etc/os-release
}

show_platform_note() {
    if is_ubuntu; then
        log "Ubuntu detected."
    else
        warn "Ubuntu was not detected."
        warn "This script is primarily intended for Ubuntu."
        warn "Continuing anyway..."
    fi

    if is_wsl; then
        log "WSL environment detected."
    else
        log "Non-WSL environment detected."
        log "This is fine as long as you are using Ubuntu."
    fi

    echo
    log "Recommended environment policy:"
    echo "  - Supported target: Ubuntu"
    echo "  - Recommended for Windows users: WSL Ubuntu + VSCode"
}

main() {
    echo "=================================================="
    echo " LaTeX Thesis Template Setup (Ubuntu) "
    echo "=================================================="

    require_command sudo
    require_command apt

    show_platform_note

    log "Updating package lists..."
    sudo apt update

    log "Installing TeX Live full package set..."
    sudo apt install -y texlive-full

    require_command kanji-config-updmap-sys

    log "Configuring Japanese font family to '${RECOMMENDED_FONT}'..."
    sudo kanji-config-updmap-sys "${RECOMMENDED_FONT}"

    log "Refreshing TeX filename database..."
    sudo mktexlsr

    log "Setup completed."
    echo
    log "Installed tool versions:"
    uplatex --version | head -n 1 || true
    latexmk -v | head -n 1 || true
    dvipdfmx --version | head -n 1 || true
    upbibtex --version | head -n 1 || true

    echo
    log "Current Japanese font configuration:"
    kanji-config-updmap-sys status || true

    echo
    log "Next steps:"
    echo "  1. Run: ./scripts/setup-vscode.sh"
    echo "  2. Run: ./scripts/check-environment.sh"
    echo
    echo "  Then build the document:"
    echo "    Open this repository in VSCode and save main.tex"
    echo "    or run: make"
}

main "$@"
