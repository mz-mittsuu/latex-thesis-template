# latex-thesis-template

[![build](https://github.com/mz-mittsuu/latex-thesis-template/actions/workflows/build-pdf.yml/badge.svg)](https://github.com/mz-mittsuu/latex-thesis-template/actions/workflows/build-pdf.yml)
[![license](https://img.shields.io/github/license/mz-mittsuu/latex-thesis-template)](LICENSE)
![LaTeX](https://img.shields.io/badge/LaTeX-upLaTeX-blue)
![Template](https://img.shields.io/badge/template-github-green)

学位論文作成のための **LaTeX thesis template** です。
環境構築から PDF 生成までを簡単に行えるように、論文テンプレートとセットアップスクリプトを提供します。

## Features

- 日本語論文向け（**upLaTeX + dvipdfmx**）
- 論文構造に対応したディレクトリ構成
- **VSCode + LaTeX Workshop** を推奨
- `make` / `latexmk` によるビルド
- **GitHub Actions** による PDF 自動ビルド
- **Ubuntu 向け環境構築スクリプト**

## Create Your Thesis Repository

このリポジトリは **GitHub Template Repository** として公開されています。

GitHub の **Use this template** ボタンを押すことで、
このテンプレートをベースに新しい論文リポジトリを作成できます。

## Quick Start (Recommended)

```bash
git clone https://github.com/mz-mittsuu/latex-thesis-template.git
cd latex-thesis-template

./scripts/check-environment.sh

# If environment is not ready
./scripts/setup-all.sh

make
```

生成される PDF:

```
build/main.pdf
```

## Project Structure

```
latex-thesis-template
├── LICENSE
├── Makefile
├── README.md
├── frontmatter      # 表紙・要旨・目次
├── mainmatter       # 各章
├── backmatter       # 謝辞・参考文献・付録
├── bib              # BibTeX 文献データ
├── figures          # 図
├── style            # LaTeX style
├── scripts          # 環境構築スクリプト
└── build            # ビルド生成物
```

主要ファイル：

| File | Description |
| -------------------- | ------------ |
| `main.tex`           | 論文全体の構成 |
| `style/thesis.sty`   | スタイル定義   |
| `mainmatter/*`       | 各章         |
| `bib/references.bib` | 参考文献      |
| `figures/`           | 図ファイル    |

## Recommended Environment

推奨環境：

- **Ubuntu**
- **TeX Live**
- **VSCode**
- **LaTeX Workshop**

---

# Environment Setup

## Automatic Setup (Recommended)

```bash
./scripts/setup-all.sh
```

このスクリプトは以下を実行します：

1. TeX Live インストール
2. 日本語フォント設定
3. VSCode extension インストール
4. 環境チェック

## Manual Setup

## Install TeX Live

### setup-texlive.sh を使う方法

```bash
./scripts/setup-texlive.sh
```

### 手動インストール

```bash
sudo apt update
sudo apt install -y texlive-full
sudo kanji-config-updmap-sys haranoaji
```

`texlive-full` は容量が大きいですが
パッケージ不足によるトラブルを避けられるため推奨しています。

容量を抑えたい場合：

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

### Japanese Font Configuration

TeX Live では以下の日本語フォントが利用できます。

フォント設定は **kanji-config-updmap-sys** により行われます。

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

### setup-vscode.sh を使う方法

```bash
./scripts/setup-vscode.sh
```

### 手動インストール

```bash
code --install-extension james-yu.latex-workshop
code --install-extension yzhang.markdown-all-in-one
code --install-extension ms-vscode.makefile-tools
code --install-extension github.vscode-github-actions
code --install-extension shardulm94.trailing-spaces
```

### VSCode UI を使う方法

1. VSCode を開く
2. Extensions を開く
3. Recommended Extensions を確認

# Build

## VSCode (Recommended)

VSCode + LaTeX Workshop を使用する場合

### 方法1

```
main.tex を保存
```

LaTeX Workshop が自動ビルドします。

### 方法2

```
Ctrl + Alt + B
```

### PDF表示

```
Ctrl + Alt + V
```

## Makefile

```bash
make
```

PDF をビルドします。

### clean

```bash
make clean
```

中間ファイル（aux / log / toc など）を削除します。

### distclean

```bash
make distclean
```

`build/` ディレクトリを含むすべての生成物を削除します。

## latexmk

```bash
latexmk main.tex
```

# Writing Thesis

最初に編集するファイル：

```
main.tex
```

論文の各章：

```
mainmatter/
```

図：

```
figures/
```

参考文献：

```
bib/references.bib
```

# GitHub Actions

**GitHub Actions により PDF が自動ビルド**されます。

トリガー：

- `push`
- `pull_request`
- `workflow_dispatch`

生成された PDF は **Artifacts** からダウンロードできます。

# Scripts

環境構築を補助するスクリプト：

| Scripts | Description |
| ---------------------- | ---------------------------- |
| `check-environment.sh` | 推奨環境チェック                |
| `setup-texlive.sh`     | Ubuntu + TeX Live セットアップ |
| `setup-vscode.sh`      | VSCode extension インストール  |
| `setup-all.sh`         | 全セットアップ                 |

# License

MIT License

詳細は [LICENSE](LICENSE) を参照してください。
