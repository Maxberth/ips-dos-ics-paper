# Configuración de latexmk para el paper (Springer LNCS)
$pdf_mode = 1;            # pdflatex
$bibtex_use = 2;          # ejecutar bibtex y borrar .bbl con latexmk -C
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 %O %S';
@default_files = ('main.tex');
