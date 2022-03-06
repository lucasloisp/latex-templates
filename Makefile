CHAPTER_DIR = chapters
CHAPTER_TEX := $(wildcard $(CHAPTER_DIR)/*.tex)

SVG_DIR = figures
SVG_FILES := $(wildcard $(SVG_DIR)/*.svg)

IMG_PNG := $(wildcard img/*.png)

BIB_FILE = bibliography.bib

CLASS_FILE = baseline.cls

PLANTUML_DIR = diagrams
PLANTUML_URL = https://sourceforge.net/projects/plantuml/files/plantuml.jar/download
PLANTUML_SRC := $(wildcard $(PLANTUML_DIR)/*.plantuml)
PLANTUML_SVG := $(addprefix $(SVG_DIR)/, $(addsuffix .svg, $(notdir $(basename $(PLANTUML_SRC)))))

all : article.pdf slides.pdf

article.pdf: article.tex $(CHAPTER_TEX) $(SVG_FILES) $(IMG_PNG) $(BIB_FILE) $(CLASS_FILE) $(PLANTUML_SVG)
	latexmk -pdflatex -shell-escape article.tex

slides.pdf: slides.tex $(SVG_FILES) $(IMG_PNG) $(CLASS_FILE) $(PLANTUML_SVG)
	latexmk -pdflatex -shell-escape slides.tex

$(PLANTUML_SVG): $(SVG_DIR)/%.svg : $(PLANTUML_DIR)/%.plantuml plantuml.jar
	java -jar plantuml.jar -o ../$(SVG_DIR)/ -tsvg $<

plantuml.jar:
	curl -sSfL $(PLANTUML_URL) -o plantuml.jar


clean:
	rm -f $(SVG_DIR)/*.pdf
	rm -f $(SVG_DIR)/*.pdf_tex
	latexmk -C

.PHONY: clean all
