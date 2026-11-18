# Checklist de entrega camera-ready (ICITS'27, Springer)

**Fecha límite: 18 de noviembre de 2026.** Confirmar la hora exacta y la zona horaria en la plataforma de la conferencia.

En esta carpeta no se guardan formularios firmados, datos de pago ni credenciales. Esos archivos se suben directamente a la plataforma.

## Contenido del paper

- [x] Observaciones críticas resueltas (ver `../observaciones/registro_cambios.md`): 1, 2, 5, 11.
- [x] Título y abstract alineados con lo que se midió (obs. 4, 25). El título aceptado se mantiene; el alcance se declara en el abstract, §3 y §6.
- [ ] Revisión de inglés y tiempos verbales (obs. 12, 13).
- [ ] Entradas `% VERIFICAR DOI` y `% VERIFICAR AUTOR` de `references.bib` resueltas.
- [x] Extensión dentro del límite de páginas de la conferencia (12 páginas con referencias; el límite de ICITS'27 en inglés es 12).

## Formato (`main`: acmart, dos columnas, con las correcciones de Springer)

- [x] `\documentclass[sigconf]{acmart}` con bibliografía `ACM-Reference-Format` (la rama `respaldo-main` tiene la versión `llncs` + `splncs04`).
- [x] Título y autores completos, correos de todos y autor de correspondencia marcado (Alberth Vigo Saldaña).
- [x] Encabezados con mayúsculas y solo dos niveles numerados; pie de figura debajo y título de tabla encima; ecuaciones numeradas.
- [x] Figuras vectoriales (PDF) generadas por script, con letra de al menos 6 pt y marcadores distintos por escenario (legibles en blanco y negro).
- [x] Tablas a tamaño natural, sin escalar, con dos tamaños de letra uniformes.
- [x] Compila sin errores ni referencias sin resolver (`make`), con las fuentes embebidas (`pdffonts main.pdf`).
- [x] 12 páginas con referencias (límite de ICITS'27 para inglés: 12).
- [ ] ORCID de los autores con `\orcid{}`, si la conferencia lo pide.
- [ ] Confirmar con la organización qué formato aceptan (`acmart` de dos columnas o LNCS/LNNS de Springer).

## Archivos a subir

- [ ] PDF final generado con `make` (`main.pdf`).
- [x] ZIP de entrega con tres elementos al mismo nivel: carpeta del proyecto LaTeX, PDF del artículo y formulario de licencia (se genera con los pasos de `submission/README_entrega.md`).
- [ ] Formulario de copyright/consentimiento de Springer firmado (`copyright.docx`). Lo firma el autor de contacto.
- [ ] Registro de al menos un autor en la conferencia (con el pago hecho por la persona que corresponda, fuera de este repo).

## Después de subir

- [ ] Etiqueta en Git del estado entregado: `git tag -a v1-camera-ready -m "Versión entregada"` y `git push origin v1-camera-ready`.
- [ ] Guardar aquí el correo de confirmación de la plataforma, sin datos personales.

- [x] Repositorios `ips-dos-ics-lab` y `ips-dos-ics-paper` públicos (el resumen y la sección de disponibilidad los citan).
- [ ] Revisión de inglés por una persona (obs. 13).
