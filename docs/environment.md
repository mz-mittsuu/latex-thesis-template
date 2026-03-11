<!-- @file docs/environment.md -->

# Environment Setup

このドキュメントでは、論文テンプレートを使用するための環境構築方法を説明します。

- [Environment Setup](#environment-setup)
  - [Automatic Setup (Recommended)](#automatic-setup-recommended)
  - [Manual Setup](#manual-setup)
    - [Install TeX Live](#install-tex-live)
      - [Using setup script](#using-setup-script)
      - [Full Installation](#full-installation)
      - [Minimal Installation](#minimal-installation)
  - [Japanese Font Configuration](#japanese-font-configuration)
  - [VSCode Setup](#vscode-setup)
    - [Automatic Install](#automatic-install)
      - [Manual Install](#manual-install)
    - [Install via VSCode UI](#install-via-vscode-ui)


## Automatic Setup (Recommended)

以下のスクリプトを実行すると、必要な環境が自動でセットアップされます。

```bash
./scripts/setup-all.sh
```

このスクリプトは以下を実行します：

1. TeX Live インストール
2. 日本語フォント設定
3. VSCode extension インストール
4. 環境チェック


## Manual Setup

自動セットアップを使用しない場合は、以下の手順で手動セットアップが可能です。

### Install TeX Live

#### Using setup script

スクリプトを使用して TeX Live をインストールできます。

```bash
./scripts/setup-texlive.sh
```

#### Full Installation

```bash
sudo apt update

sudo apt install -y texlive-full

sudo kanji-config-updmap-sys haranoaji
```

`texlive-full` は容量が大きいですが、
パッケージ不足によるトラブルを避けることができます。

#### Minimal Installation

容量を抑えたい場合は以下でも動作します。

```bash
sudo apt update

sudo apt install -y \
   texlive-lang-japanese \
   texlive-latex-extra \
   texlive-fonts-recommended \
   texlive-science \
   latexmk

sudo kanji-config-updmap-sys haranoaji
```


## Japanese Font Configuration

TeX Live では以下の日本語フォントが利用できます。

| Fonts | Description |
| ------------- | ------------------- |
| **haranoaji** | TeX Live 標準フォント（推奨）            |
| ipa           | IPAフォント（独立行政法人情報処理推進機構） |
| ipaex         | IPAフォントの改良版                     |

HaranoAji は **TeX Live 標準の日本語フォント**であり、
PDFへのフォント埋め込みが正しく行われるため推奨しています。

現在の設定確認：

```bash
kanji-config-updmap-sys status
```


## VSCode Setup

推奨拡張：

- `james-yu.latex-workshop`
- `yzhang.markdown-all-in-one`
- `ms-vscode.makefile-tools`
- `github.vscode-github-actions`
- `shardulm94.trailing-spaces`

### Automatic Install

スクリプトを使用して拡張機能をインストールできます。

```bash
./scripts/setup-vscode.sh
```

#### Manual Install

```bash
code --install-extension james-yu.latex-workshop
code --install-extension yzhang.markdown-all-in-one
code --install-extension ms-vscode.makefile-tools
code --install-extension github.vscode-github-actions
code --install-extension shardulm94.trailing-spaces
```

### Install via VSCode UI

1. VSCode を開く
2. Extensions を開く
3. Recommended Extensions を確認
