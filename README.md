<!-- @file README.md -->

# latex-thesis-template

[![build](https://github.com/mz-mittsuu/latex-thesis-template/actions/workflows/build-pdf.yml/badge.svg)](https://github.com/mz-mittsuu/latex-thesis-template/actions/workflows/build-pdf.yml)
[![license](https://img.shields.io/github/license/mz-mittsuu/latex-thesis-template)](LICENSE)
![LaTeX](https://img.shields.io/badge/LaTeX-upLaTeX-blue)
![Template](https://img.shields.io/badge/template-github-green)
![stars](https://img.shields.io/github/stars/mz-mittsuu/latex-thesis-template)

LaTeX を使った **学位論文作成のための thesis template** です。  
**VSCode + LaTeX Workshop** を利用して、**環境構築から PDF 生成までを簡単に行える**ように、セットアップスクリプトと論文テンプレートを提供します。

- 日本語論文対応
- Ubuntu 向けセットアップスクリプト
- VSCode で保存するだけで PDF ビルド
- GitHub Actions による自動 PDF 生成
- 📄 [Sample PDF](docs/sample.pdf)

⭐ **If this template helps your thesis writing, please consider giving it a star!**


## Getting Started

![demo](docs/demo.gif)

### 1. Create repository from template

GitHub の **Use this template** ボタンを押して  
このテンプレートから新しいリポジトリを作成します。

```
Use this template
↓
Create new repository
```

### 2. Clone repository

```bash
git clone https://github.com/<your-name>/<repo-name>.git
cd <repo-name>
```

### 3. Setup environment

環境チェック：

```bash
./scripts/check-environment.sh
```

環境構築：

```bash
./scripts/setup-all.sh
```

### 4. Open in VSCode

```
code .
```

### 5. Build PDF

`main.tex` を保存すると
**LaTeX Workshop が自動で PDF をビルドします。**

生成される PDF：

```
build/main.pdf
```


## Project Structure

```
latex-thesis-template
├── main.tex        # 論文のエントリーポイント
├── frontmatter/    # 表紙・要旨・目次
├── mainmatter/     # 各章
├── backmatter/     # 謝辞・付録・参考文献
├── bib/            # BibTeX 文献
├── figures/        # 図ファイル
├── style/          # LaTeX style
├── scripts/        # 環境構築スクリプト
└── docs/           # デモ・サンプルPDF
```

主要ファイル：

| File | Description |
| -------------------- | ------------ |
| `main.tex`           | 論文全体の構成 |
| `style/thesis.sty`   | スタイル定義   |
| `mainmatter/*`       | 各章         |
| `bib/references.bib` | 参考文献      |
| `figures/`           | 図ファイル    |


## Documentation

詳細な説明はこちら：

* [Environment Setup](docs/environment.md)
* [Build Guide](docs/build.md)
* [Writing Guide](docs/writing.md)


## License

MIT License

詳細は [LICENSE](LICENSE) を参照してください。
