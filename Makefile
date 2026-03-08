# @file Makefile
# @brief Makefile for building the LaTeX document.

MAIN := main
LATEXMK := latexmk
BUILD_DIR := build

.PHONY: all pdf clean distclean

all: pdf

pdf:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) $(MAIN).tex

clean:
	$(LATEXMK) -c $(MAIN).tex

distclean: clean
	rm -rf $(BUILD_DIR)
