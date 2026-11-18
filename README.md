# IPS contra DoS en redes de control industrial: paper ICITS'27

Fuente LaTeX del artículo *Implementation of an Intrusion Prevention System for Mitigating DoS Attacks in Industrial Control Networks Based on PLC and Industrial Switch Protection*, aceptado como Full Paper en ICITS'27 (submission 418).

Repositorio público. Los datos, scripts, figuras y tablas de resultados salen del laboratorio: [`Maxberth/ips-dos-ics-lab`](https://github.com/Maxberth/ips-dos-ics-lab). La versión del laboratorio citada en el artículo es su etiqueta `icits27-final`.

## Qué hay en cada rama y etiqueta

| Referencia | Contenido |
|---|---|
| `main` | Versión vigente: formato `acmart` de dos columnas (el de la primera versión) con las correcciones de las guías de Springer. **12 páginas.** |
| `respaldo-main` | Copia de seguridad de `main` antes del cambio de formato: versión en formato Springer `llncs` de una columna (12 páginas). |
| etiqueta `icits27-final` | Estado exacto de `main` que cita el artículo. |
| etiqueta `v0-acmart-original` | Primera versión enviada, sin cambios. |

## Compilar

Requiere TeX Live con `pdflatex`, `bibtex`, `latexmk` y la clase `acmart` (viene en TeX Live; para entregar a un tercero, el ZIP de entrega incluye una copia de `acmart.cls` y de `ACM-Reference-Format.bst`).

```bash
make            # compila main.pdf
make watch      # recompila al guardar
make clean      # borra auxiliares, conserva main.pdf
make distclean  # borra todo lo generado
```

Sin `make`: `latexmk main.tex` (lee `latexmkrc`), o `pdflatex main && bibtex main && pdflatex main && pdflatex main`.

## Estructura

```
main.tex            Preámbulo acmart, título, autores, resumen, palabras clave y \input de las secciones
sections/           Una sección por archivo (01_introduction … 06_conclusions)
figures/            Figuras del artículo, en PDF vectorial (generadas por el laboratorio; ver figures/README.md)
tables/             Tablas LaTeX del artículo (generadas por el laboratorio)
references.bib      Bibliografía
latexmkrc, Makefile Compilación
observaciones/      Comentarios de los revisores (matriz 0–26) y registro de cambios por observación
submission/         Lista de verificación de la entrega y texto alternativo de las figuras
version_inicial/    Primera versión enviada (acmart), intacta. NO es el LaTeX vigente (ver su PROCEDENCIA.md)
```

## Convenciones

- **Figuras y tablas no se editan a mano:** las genera el laboratorio (`lab/analysis/figuras_paper.py`, `figuras_arquitectura.py`, `tablas_paper.py`) desde los datos crudos; aquí solo se copian.
- **Etiquetas** con prefijo y en kebab-case (`sec:`, `fig:`, `tab:`, `eq:`); siempre se citan con `\ref{}`, nunca con números escritos a mano.
- **Commits** en español y descriptivos. Si un commit resuelve una observación de los revisores, el mensaje dice `(obs. N)` y el hash se anota en `observaciones/registro_cambios.md`.
- No se cambian resultados, tablas ni afirmaciones sin datos del laboratorio que los respalden.

## Estado

- Versión final del artículo en `main`, 12 páginas, sin referencias sin resolver y con las fuentes embebidas.
- Las observaciones con datos del laboratorio están incorporadas (ver `observaciones/registro_cambios.md`); parciales: 9, 13 y 14.
- Pendiente: revisión de inglés por una persona y los trámites de la conferencia (formulario de licencia firmado e inscripción).
