.PHONY: clean

GRAPHIC_DIR = figures
CHAPTERS_DIR = chapters
FIGSRC	:= $(wildcard $(GRAPHIC_DIR)/*.svg)
CHPSRC  := $(wildcard $(CHAPTERS_DIR)/*.tex)
FIG	:= $(FIGSRC:%.svg=%.pdf)
FIGTEX	:= $(FIGSRC:%.svg=%.pdf_tex)

article.pdf: article.tex bibliografia.bib $(FIGSRC) $(CHPSRC) *.sty *.cls
	latexmk -pdflatex -shell-escape article.tex

clean:
	rm -f figures/*.pdf
	rm -f figures/*.pdf_tex
	latexmk -C
