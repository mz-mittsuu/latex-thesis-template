# @file .latexmkrc
# @brief LaTeXmk configuration for building the LaTeX document.

$latex = 'uplatex -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'upbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';

$out_dir = 'build';
$aux_dir = 'build';

$max_repeat = 5;

$pdf_mode = 3;
