<!-- @file docs/writing.md -->

# Writing Guide

このドキュメントでは、論文テンプレートの **ディレクトリ構成** と **各ファイルの役割**を説明します。

- [Writing Guide](#writing-guide)
  - [Main File](#main-file)
  - [Metadata](#metadata)
  - [Front Matter](#front-matter)
  - [Main Matter](#main-matter)
  - [Back Matter](#back-matter)
  - [Figures](#figures)
  - [References](#references)
  - [Recommended Workflow](#recommended-workflow)


## Main File

論文のエントリーポイント：

```
main.tex
```

このファイルが **論文全体の構造を定義**します。

主な役割：

- 論文メタデータ定義
- スタイル読み込み
- 各章ファイルの読み込み


## Metadata

論文タイトルや著者情報は `main.tex` で定義します。

```latex
\newcommand{\ThesisType}{修士論文}
\newcommand{\ThesisTitle}{論文タイトル}
\newcommand{\AuthorName}{○○ ○○}
\newcommand{\StudentID}{学籍番号}
\newcommand{\Affiliation}{○○大学 大学院 ○○研究科 ○○専攻}
\newcommand{\Advisor}{○○ ○○ 教授}
\newcommand{\SubmissionDate}{20XX年X月X日}
```

これらの情報は **タイトルページなどで使用されます**。


## Front Matter

論文の前半部分です。

```
frontmatter/
```

主に次の内容を含みます：

```
frontmatter
├── titlepage.tex
├── abstract.tex
└── toc.tex
```

| File          | Description |
| ------------- | ----------- |
| titlepage.tex | 表紙         |
| abstract.tex  | 要旨         |
| toc.tex       | 目次         |


## Main Matter

論文の本文です。

```
mainmatter/
```

例：

```
mainmatter
├── 01_introduction.tex
├── 02_background.tex
├── 03_method.tex
├── 04_results.tex
└── 05_conclusion.tex
```

| File            | Description |
| --------------- | ----------- |
| 01_introduction | 研究背景・目的 |
| 02_background   | 関連研究      |
| 03_method       | 提案手法      |
| 04_results      | 実験結果      |
| 05_conclusion   | まとめ       |

章番号を付けることで **章の順序が分かりやすくなります**。


## Back Matter

論文の後半部分です。

```
backmatter/
```

例：

```
backmatter
├── acknowledgements.tex
├── bibliography.tex
└── appendix_a.tex
```

| File             | Description |
| ---------------- | ----------- |
| acknowledgements | 謝辞         |
| bibliography     | 参考文献      |
| appendix         | 付録         |


## Figures

図は次のディレクトリに配置します。

```
figures/
```

例：

```
figures
└── appendix_a.tex
```

LaTeX では次のように読み込みます。

```latex
\includegraphics{figures/example.pdf}
```


## References

参考文献は **BibTeX** 形式で管理します。

```
bib/references.bib
```

例：

```bibtex
@book{lamport1994latex,
  author    = {Leslie Lamport},
  title     = {\LaTeX{}: A Document Preparation System},
  publisher = {Addison-Wesley},
  year      = {1994},
  edition   = {2}
}
```


## Recommended Workflow

論文執筆の基本的な流れ：

1. `mainmatter/` に章を書く
2. 図を `figures/` に追加
3. 文献を `bib/references.bib` に追加
4. `main.tex` を保存して PDF ビルド

VSCode + LaTeX Workshop を使用している場合
**`main.tex` を保存するだけで PDF が自動生成されます。**
