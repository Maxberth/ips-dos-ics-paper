# IPS contra DoS en redes de control industrial: paper ICITS'27

Fuente LaTeX del artículo *Implementation of an Intrusion Prevention System for Mitigating DoS Attacks in Industrial Control Networks Based on PLC and Industrial Switch Protection*, aceptado como Full Paper en ICITS'27 (submission 418).
La rama `main` usa el formato original de la versión enviada (`acmart`, dos columnas) con las correcciones de las guías de Springer (letra de figuras ≥ 6 pt, pie de figura debajo y de tabla encima, encabezados con mayúsculas y solo dos niveles numerados, ecuaciones numeradas, autor de correspondencia marcado). La rama `respaldo-main` conserva la versión en formato Springer `llncs` (una columna, 12 páginas) como respaldo.

Repositorio privado. Los datos, scripts y figuras de resultados salen del laboratorio: [`Maxberth/ips-dos-ics-lab`](https://github.com/Maxberth/ips-dos-ics-lab).

## Compilar

Requiere TeX Live con `pdflatex`, `bibtex` y `latexmk`. La clase y el estilo de bibliografía vienen en el repo, así que no hace falta instalar nada de Springer.

```bash
make            # compila main.pdf
make watch      # recompila al guardar
make clean      # borra auxiliares, conserva main.pdf
make distclean  # borra todo lo generado
```

Sin `make`: `latexmk main.tex` (lee `latexmkrc`), o `pdflatex main && bibtex main && pdflatex main && pdflatex main`.

## Estructura

```
main.tex            Preámbulo LNCS, título, autores, abstract, keywords y \input de las secciones
sections/           Una sección por archivo (01_introduction … 06_conclusions)
figures/            Imágenes usadas por el paper (mapa de nombres en figures/README.md)
references.bib      Bibliografía
llncs.cls           Clase Springer LNCS v2.26 (solo la usa la rama respaldo-main)
splncs04.bst        Estilo de bibliografía de Springer
latexmkrc, Makefile Compilación
actual/             Versión enviada con acmart, intacta (ver actual/PROCEDENCIA.md)
observaciones/      Observaciones del revisor y registro de cambios por observación
submission/         Checklist de entrega camera-ready
```

`actual/` no se edita: es el «antes». La etiqueta `v0-acmart-original` marca ese estado.
Con `git diff v0-acmart-original` se ve todo lo que cambió desde el envío.

## Convenciones

- **Una frase por línea** en los `.tex` nuevos o editados, para que los diffs muestren frases y no párrafos enteros. El texto heredado de `actual/` conserva sus párrafos en una línea y se parte al editarlo.
- **Figuras** en `figures/` con nombres en `snake_case`, sin espacios ni tildes. En `\includegraphics` va solo el nombre del archivo (`\graphicspath` ya apunta a `figures/`).
- **Etiquetas** con prefijo y en kebab-case: `sec:`, `fig:`, `tab:`, `eq:` (por ejemplo `fig:latency-comparison`). Siempre se cita con `\ref{}`, nunca con números escritos a mano.
- **Commits** en español. Si un commit resuelve una observación del revisor, el mensaje dice `(obs. N)` y el hash se anota en `observaciones/registro_cambios.md`.
- No se cambian resultados, tablas de datos ni afirmaciones científicas sin datos del laboratorio que los respalden.

## Relación con el laboratorio

[`ips-dos-ics-lab`](https://github.com/Maxberth/ips-dos-ics-lab) contiene la arquitectura, los scripts, los datos crudos y procesados, y genera las figuras (`figures/`) y tablas (`tables/`) de resultados.
Cuando una figura o tabla del laboratorio entre al paper, se copia a `figures/` (o a una tabla `.tex` en `sections/`) y el commit indica de qué commit del laboratorio sale.

## Estado

- Plantilla LNCS: hecha. Compila sin errores ni referencias indefinidas, con todas las fuentes embebidas.
- Extensión: **12 páginas** en `acmart` de dos columnas (límite de ICITS'27 para inglés: 12). La versión `llncs` de `respaldo-main` también ocupa 12.
- Observaciones: todas las que tienen datos del laboratorio están incorporadas al manuscrito (ver `observaciones/registro_cambios.md`); parciales: 9, 13, 14. Pendiente: publicar los repositorios y la revisión de inglés.
