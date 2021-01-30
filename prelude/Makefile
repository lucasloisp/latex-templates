GRAPHIC_DIR = figures
CHAPTERS_DIR = chapters
FIGSRC	:= $(wildcard $(GRAPHIC_DIR)/*.svg)
CHPSRC  := $(wildcard $(CHAPTERS_DIR)/*.tex)
FIG	:= $(FIGSRC:%.svg=%.pdf)
FIGTEX	:= $(FIGSRC:%.svg=%.pdf_tex)

document.pdf : document.tex $(FIG) $(FIGTEX) bibliografia.bib $(CHPSRC) *.sty
	latexmk -pdf -quiet document.tex

figures/%.pdf figures/%.pdf_tex &: figures/%.svg
	inkscape --export-filename=$(<:.svg=.pdf) --export-latex --export-area-page $<
