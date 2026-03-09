#!/usr/bin/env bash
# @file scripts/setup-all.sh
# @brief Run full setup for the recommended environment.

set -e

echo "=================================================="
echo " LaTeX Thesis Template Full Setup"
echo "=================================================="

echo
echo "[STEP 1] Ubuntu + TeX Live setup"
./scripts/setup-ubuntu.sh

echo
echo "[STEP 2] VSCode extension setup"
./scripts/setup-vscode.sh

echo
echo "[STEP 3] Environment check"
./scripts/check-environment.sh

echo
echo "=================================================="
echo " Setup completed."
echo "=================================================="

echo
echo "Next steps:"
echo "  Build the document:"
echo "    Open this repository in VSCode and save main.tex"
echo "    or run: make"
