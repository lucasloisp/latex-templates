GRAPHIC_DIR = figures
CHAPTERS_DIR = chapters
FIGSRC	:= $(wildcard $(GRAPHIC_DIR)/*.svg)
CHPSRC  := $(wildcard $(CHAPTERS_DIR)/*.tex)
FIG	:= $(FIGSRC:%.svg=%.pdf)
FIGTEX	:= $(FIGSRC:%.svg=%.pdf_tex)

informe.pdf : informe.tex $(FIG) $(FIGTEX) bibliografia.bib $(CHPSRC) configurado.sty
	latexmk -pdf -quiet informe.tex

figures/%.pdf figures/%.pdf_tex &: figures/%.svg
	inkscape --export-filename=$(<:.svg=.pdf) --export-latex --export-area-page $<
