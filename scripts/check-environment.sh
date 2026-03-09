#!/usr/bin/env bash
# @file scripts/check-environment.sh
# @brief Check whether the recommended WSL Ubuntu + TeX Live + VSCode environment is ready.

set -euo pipefail

readonly EXPECTED_FONT="haranoaji"

pass() {
    echo "[PASS] $*"
}

warn() {
    echo "[WARN] $*" >&2
}

fail() {
    echo "[FAIL] $*" >&2
}

check_command() {
    local cmd="$1"
    if command -v "$cmd" >/dev/null 2>&1; then
        pass "Command found: ${cmd}"
        return 0
    else
        fail "Command not found: ${cmd}"
        return 1
    fi
}

check_wsl() {
    if grep -qi "microsoft" /proc/version 2>/dev/null; then
        pass "Running on WSL"
    else
        warn "Not running on WSL"
    fi
}

check_ubuntu() {
    if [[ -f /etc/os-release ]] && grep -q '^ID=ubuntu' /etc/os-release; then
        pass "Ubuntu detected"
    else
        warn "Ubuntu not detected"
    fi
}

check_font_config() {
    if ! command -v kanji-config-updmap-sys >/dev/null 2>&1; then
        fail "kanji-config-updmap-sys not found"
        return 1
    fi

    local status_output
    status_output="$(kanji-config-updmap-sys status 2>/dev/null || true)"

    if echo "${status_output}" | grep -q "CURRENT family for ja: ${EXPECTED_FONT}"; then
        pass "Japanese font family is set to ${EXPECTED_FONT}"
    else
        warn "Japanese font family is not set to ${EXPECTED_FONT}"
        echo "${status_output}"
    fi
}

check_vscode_extensions() {
    if ! command -v code >/dev/null 2>&1; then
        warn "'code' command not found, skipping VSCode extension check"
        return 0
    fi

    local missing=0
    local extensions=(
        "james-yu.latex-workshop"
        "yzhang.markdown-all-in-one"
        "ms-vscode.makefile-tools"
        "github.vscode-github-actions"
        "shardulm94.trailing-spaces"
    )

    local installed
    installed="$(code --list-extensions 2>/dev/null || true)"

    local ext
    for ext in "${extensions[@]}"; do
        if echo "${installed}" | grep -qx "${ext}"; then
            pass "VSCode extension installed: ${ext}"
        else
            warn "VSCode extension missing: ${ext}"
            missing=1
        fi
    done

    return "${missing}"
}

check_repo_files() {
    local missing=0
    local files=(
        "main.tex"
        "Makefile"
        ".latexmkrc"
        ".vscode/settings.json"
        "style/thesis.sty"
    )

    local file
    for file in "${files[@]}"; do
        if [[ -e "${file}" ]]; then
            pass "Found repo file: ${file}"
        else
            fail "Missing repo file: ${file}"
            missing=1
        fi
    done

    return "${missing}"
}

main() {
    echo "=================================================="
    echo " Environment Check "
    echo "=================================================="

    local status=0

    echo "=== Platform Check ==="
    check_wsl
    check_ubuntu

    echo
    echo "=== Command Check ==="
    check_command uplatex || status=1
    check_command latexmk || status=1
    check_command dvipdfmx || status=1
    check_command upbibtex || status=1
    check_command make || status=1
    check_command kanji-config-updmap-sys || status=1

    echo
    echo "=== Font Check ==="
    check_font_config || status=1

    echo
    echo "=== VSCode Extension Check ==="
    check_vscode_extensions || true

    echo
    echo "=== Repository Check ==="
    check_repo_files || status=1

    echo
    if [[ "${status}" -eq 0 ]]; then
        pass "Recommended environment check completed successfully."

        echo
        echo "[INFO] Next steps:"
        echo "  Build the document:"
        echo "    Open this repository in VSCode and save main.tex"
        echo "    or run: make"
    else
        fail "Some required items are missing."
        exit 1
    fi
}

main "$@"
