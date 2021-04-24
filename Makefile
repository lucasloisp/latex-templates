.PHONY: clean

GRAPHIC_DIR = figures
CHAPTERS_DIR = chapters
FIGSRC	:= $(wildcard $(GRAPHIC_DIR)/*.svg)
CHPSRC  := $(wildcard $(CHAPTERS_DIR)/*.tex)
FIG	:= $(FIGSRC:%.svg=%.pdf)
FIGTEX	:= $(FIGSRC:%.svg=%.pdf_tex)

informe.pdf: informe.tex $(FIG) $(FIGTEX) bibliografia.bib $(CHPSRC) *.sty
	latexmk -xelatex -shell-escape informe.tex

presentacion.pdf: presentacion.tex $(FIG) $(FIGTEX) bibliografia.bib $(CHPSRC) *.sty
	latexmk -pdf -quiet presentacion.tex

figures/%.pdf figures/%.pdf_tex &: figures/%.svg
	inkscape --export-filename=$(<:.svg=.pdf) --export-latex --export-area-page $<

clean:
	rm -f figures/*.pdf
	rm -f figures/*.pdf_tex
	latexmk -C
