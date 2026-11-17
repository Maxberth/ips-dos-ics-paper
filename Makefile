# Compilación del paper. Requiere TeX Live con latexmk.
MAIN := main

.PHONY: all pdf watch clean distclean

all: pdf

pdf:
	latexmk $(MAIN).tex

watch:
	latexmk -pvc -view=none $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
