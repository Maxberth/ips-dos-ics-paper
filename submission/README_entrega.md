# Entrega a la conferencia (ZIP)

El ZIP lleva tres elementos al mismo nivel:

```
ICITS27_418.zip
├── ICITS27_418_latex/                   proyecto LaTeX autocontenido (compila con latexmk)
├── ICITS27_418_paper.pdf                PDF del artículo (generado al compilar ese proyecto)
└── ICITS27_418_license-to-publish.docx  formulario de licencia de Springer, firmado a mano por el autor de correspondencia
```

La carpeta LaTeX contiene `main.tex`, `sections/`, `figures/` (solo las figuras citadas, en PDF), `tables/`, `references.bib`, el `main.bbl` ya generado, `acmart.cls` y `ACM-Reference-Format.bst` (para que compile sin depender de la instalación del receptor) y las instrucciones `LEEME_compilar.txt`. No incluye `version_inicial/`, `observaciones/`, `submission/`, archivos auxiliares ni el historial de Git.

Antes de generarlo, comprobar que compila desde cero en una carpeta vacía y que el PDF resultante es el que se entrega.
