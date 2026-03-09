#!/usr/bin/env bash
# @file scripts/setup-vscode.sh
# @brief Install recommended VSCode extensions for the thesis template.

set -euo pipefail

readonly EXTENSIONS=(
    "james-yu.latex-workshop"
    "yzhang.markdown-all-in-one"
    "ms-vscode.makefile-tools"
    "github.vscode-github-actions"
    "shardulm94.trailing-spaces"
)

log() {
    echo "[INFO] $*"
}

die() {
    echo "[ERROR] $*" >&2
    exit 1
}

require_command() {
    local cmd="$1"
    command -v "$cmd" >/dev/null 2>&1 || die "Required command not found: $cmd"
}

main() {
    echo "=================================================="
    echo " VSCode Extension Setup "
    echo "=================================================="

    require_command code

    log "Installing recommended VSCode extensions..."

    local ext
    for ext in "${EXTENSIONS[@]}"; do
        log "Installing: ${ext}"
        code --install-extension "${ext}"
    done

    echo
    log "Installed extensions:"
    code --list-extensions | grep -E \
        '^(james-yu\.latex-workshop|yzhang\.markdown-all-in-one|ms-vscode\.makefile-tools|github\.vscode-github-actions|shardulm94\.trailing-spaces)$' \
        || true

    echo
    log "VSCode extension setup completed."

    echo
    log "Next steps:"
    echo "  1. Run: ./scripts/check-environment.sh"
    echo
    echo "  Then build the document:"
    echo "    Open this repository in VSCode and save main.tex"
    echo "    or run: make"
}

main "$@"
