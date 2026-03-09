# latex-thesis-template

[![build](https://github.com/mz-mittsuu/latex-thesis-template/actions/workflows/build-pdf.yml/badge.svg)](https://github.com/mz-mittsuu/latex-thesis-template/actions/workflows/build-pdf.yml)


学位論文作成のための **LaTeX thesis template** です。
環境構築から PDF 生成までを簡単に行えるように、論文テンプレートとセットアップスクリプトを提供します。

主な特徴：

- 日本語論文向け（**upLaTeX + dvipdfmx**）
- 論文構造に対応したディレクトリ構成
- **VSCode + LaTeX Workshop** を推奨
- `make` / `latexmk` によるビルド
- **GitHub Actions** による PDF 自動ビルド
- **WSL Ubuntu 向け環境構築スクリプト**

---

## Create Your Thesis Repository

このリポジトリは **GitHub Template Repository** として公開されています。

GitHub の **Use this template** ボタンを押すことで、
このテンプレートをベースに新しい論文リポジトリを作成できます。

---

## Quick Start (Recommended)

```bash
git clone https://github.com/mz-mittsuu/latex-thesis-template.git
cd latex-thesis-template

./scripts/check-environment.sh

# If environment is not ready
./scripts/setup-all.sh

make
```

生成された PDF:

```
build/main.pdf
```

---

## Project Structure

```
latex-thesis-template
├── LICENSE
├── Makefile
├── README.md
├── frontmatter        # 表紙・要旨・目次
├── mainmatter         # 各章
├── backmatter         # 謝辞・参考文献・付録
├── bib                # BibTeX 文献データ
├── figures            # 図
├── style              # LaTeX style
├── scripts            # 環境構築スクリプト
└── build              # ビルド生成物
```

主要ファイル：

| ファイル                 | 説明      |
| -------------------- | ------- |
| `main.tex`           | 論文全体の構成 |
| `style/thesis.sty`   | スタイル定義  |
| `mainmatter/*`       | 各章      |
| `bib/references.bib` | 参考文献    |
| `figures/`           | 図ファイル   |

---

## Recommended Environment

推奨環境：

* **Windows + WSL Ubuntu**
* **TeX Live**
* **VSCode**
* **LaTeX Workshop**

---

## Environment Setup

### Automatic Setup (Recommended)

```bash
./scripts/setup-all.sh
```

このスクリプトは以下を実行します：

1. TeX Live インストール
2. 日本語フォント設定
3. VSCode extension インストール
4. 環境チェック

---

## Manual Setup

### Install TeX Live

```bash
sudo apt update
sudo apt install -y texlive-full
```

容量は大きいですが、パッケージ不足によるトラブルを避けられます。

---

### Minimal Installation

ディスク容量を抑えたい場合：

```bash
sudo apt update
sudo apt install -y \
   texlive-lang-japanese \
   texlive-latex-extra \
   texlive-fonts-recommended \
   texlive-science \
   latexmk
```

---

## Japanese Font Configuration

TeX Live では以下の日本語フォントが利用できます。
フォントは **kanji-config-updmap-sys** により設定されます。

| フォント | 説明 |
| ------------- | ------------------- |
| **haranoaji** | TeX Live 標準フォント（推奨）            |
| ipa           | IPAフォント（独立行政法人情報処理推進機構） |
| ipaex         | IPAフォントの改良版                     |

現在の設定確認：

```bash
kanji-config-updmap-sys status
```

推奨設定：

```bash
sudo kanji-config-updmap-sys haranoaji
```

HaranoAji は **TeX Live 標準の日本語フォント**であり、
PDFへのフォント埋め込みが正しく行われるため推奨しています。

---

## VSCode Setup

推奨拡張：

* `james-yu.latex-workshop`
* `yzhang.markdown-all-in-one`
* `ms-vscode.makefile-tools`
* `github.vscode-github-actions`
* `shardulm94.trailing-spaces`

インストール：

```bash
./scripts/setup-vscode.sh
```

---

## Build

### VSCode (Recommended)

VSCode + LaTeX Workshop を使用する場合は、
`main.tex` を保存するだけで自動ビルドされます。

1. `main.tex` を開く
2. 保存する

LaTeX Workshop が自動ビルドします。

---

### Makefile

```bash
make
```

---

### latexmk

```bash
latexmk main.tex
```

---

## Writing Thesis

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

---

## GitHub Actions

このリポジトリでは **GitHub Actions により PDF が自動ビルド**されます。

トリガー：

* `push`
* `pull_request`
* `workflow_dispatch`

生成された PDF は **Artifacts** からダウンロードできます。

---

## Scripts

環境構築を補助するスクリプト：

| スクリプト | 説明 |
| ---------------------- | -------------------------------- |
| `check-environment.sh` | 推奨環境チェック                    |
| `setup-ubuntu.sh`      | WSL Ubuntu + TeX Live セットアップ |
| `setup-vscode.sh`      | VSCode extension インストール      |
| `setup-all.sh`         | 全セットアップ                      |

---

## License

MIT License

詳細は [LICENSE](LICENSE) を参照してください。
