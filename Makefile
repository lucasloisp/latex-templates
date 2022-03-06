CHAPTER_DIR = chapters
CHAPTER_TEX := $(wildcard $(CHAPTER_DIR)/*.tex)

SVG_DIR = figures
SVG_FILES := $(wildcard $(SVG_DIR)/*.svg)

IMG_PNG := $(wildcard img/*.png)

BIB_FILE = bibliography.bib

CLASS_FILE = baseline.cls

# Plantuml diagrams
PLANTUML_URL = https://sourceforge.net/projects/plantuml/files/plantuml.jar/download
PLANTUML_SRC := $(wildcard diagrams/*.plantuml)
PLANTUML_SVG := $(addprefix figures/, $(addsuffix .svg, $(notdir $(basename $(PLANTUML_SRC)))))


all : article.pdf slides.pdf

article.pdf: article.tex $(CHAPTER_TEX) $(SVG_FILES) $(IMG_PNG) $(BIB_FILE) $(CLASS_FILE) $(PLANTUML_SVG)
	latexmk -pdflatex -shell-escape article.tex

$(PLANTUML_SVG): figures/%.svg : diagrams/%.plantuml plantuml.jar
	java -jar plantuml.jar -o ../figures/ -tsvg $<

plantuml.jar:
	curl -sSfL $(PLANTUML_URL) -o plantuml.jar

slides.pdf: slides.tex $(PLANTUML_SVG) $(IMG_PNG) $(SVG_FILES) *.sty *.cls
	latexmk -pdflatex -shell-escape slides.tex

figures/%.svg : diagrams/%.plantuml plantuml.jar
	java -jar plantuml.jar -o ../figures/ -tsvg $<


clean:
	rm -f figures/*.pdf
	rm -f figures/*.pdf
	rm -f figures/*.pdf_tex
	latexmk -C

.PHONY: clean all
