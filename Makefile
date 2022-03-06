.PHONY: clean all

GRAPHIC_DIR = figures
CHAPTERS_DIR = chapters
FIGSRC	:= $(wildcard $(GRAPHIC_DIR)/*.svg)
CHPSRC  := $(wildcard $(CHAPTERS_DIR)/*.tex)

all : article.pdf slides.pdf

article.pdf: article.tex bibliografia.bib $(FIGSRC) $(CHPSRC) *.sty *.cls
	latexmk -pdflatex -shell-escape article.tex

slides.pdf: slides.tex $(FIGSRC) *.sty *.cls
	latexmk -pdflatex -shell-escape slides.tex

clean:
	rm -f figures/*.pdf
	rm -f figures/*.pdf_tex
	latexmk -C
