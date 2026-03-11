<!-- @file docs/build.md -->

# Build Guide

このドキュメントでは論文 PDF を生成する方法を説明します。

- [Build Guide](#build-guide)
  - [VSCode (Recommended)](#vscode-recommended)
    - [Auto Build](#auto-build)
    - [Manual Build](#manual-build)
    - [View PDF](#view-pdf)
  - [Makefile](#makefile)
    - [Clean](#clean)
    - [Distclean](#distclean)


## VSCode (Recommended)

VSCode + LaTeX Workshop を使用する場合:

### Auto Build

`main.tex` を保存すると自動でビルドされます。

### Manual Build

```
Ctrl + Alt + B
```

### View PDF

```
Ctrl + Alt + V
```

## Makefile

ターミナルからビルドする場合:

```bash
make
```
PDF をビルドします。

生成される PDF：

```
build/main.pdf
```

### Clean

```bash
make clean
```

中間ファイル（aux / log / toc など）を削除します。

### Distclean

```bash
make distclean
```

`build/` ディレクトリを含むすべての生成物を削除します。
