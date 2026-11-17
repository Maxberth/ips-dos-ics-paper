# Checklist de entrega camera-ready (ICITS'27, Springer)

**Fecha límite: 18 de noviembre de 2026.** Confirmar la hora exacta y la zona horaria en la plataforma de la conferencia.

En esta carpeta no se guardan formularios firmados, datos de pago ni credenciales. Esos archivos se suben directamente a la plataforma.

## Contenido del paper

- [ ] Observaciones críticas resueltas o con su afirmación rebajada en el texto (ver `../observaciones/registro_cambios.md`): 1, 2, 5, 11.
- [ ] Título y abstract alineados con lo que se midió (obs. 4, 25).
- [ ] Revisión de inglés y tiempos verbales (obs. 12, 13).
- [ ] Entradas `% VERIFICAR DOI` y `% VERIFICAR AUTOR` de `references.bib` resueltas.
- [ ] Extensión dentro del límite de páginas de la conferencia (hoy: 26 páginas).

## Formato LNCS

- [x] `\documentclass[runningheads]{llncs}` y bibliografía `splncs04`.
- [x] `\titlerunning` y `\authorrunning`.
- [x] Autores con `\and`, afiliación en `\institute` y correos en `\email`.
- [x] Keywords separadas con `\and` dentro del abstract.
- [ ] ORCID de los autores con `\orcidID{}`, si la conferencia lo pide.
- [ ] Ciudad y país de la afiliación confirmados (hoy: «Trujillo, Peru»).
- [x] Compila sin errores ni referencias indefinidas.
- [x] Todas las fuentes embebidas en el PDF (`pdffonts main.pdf`).
- [ ] Figuras legibles impresas en blanco y negro y con resolución suficiente (≥ 300 dpi en fotos y capturas).
- [ ] Sin `Overfull \hbox` visibles en el PDF (hoy quedan seis de menos de 10 pt).

## Archivos a subir

- [ ] PDF final generado con `make` (`main.pdf`).
- [ ] Fuentes en un .zip: `main.tex`, `sections/`, `figures/`, `references.bib`, `llncs.cls`, `splncs04.bst`. Se puede generar con:
      `git archive --format=zip -o submission/fuentes.zip HEAD main.tex sections figures references.bib llncs.cls splncs04.bst`
      (sin `actual/`, `observaciones/` ni `submission/`).
- [ ] Formulario de copyright/consentimiento de Springer firmado (`copyright.docx`). Lo firma el autor de contacto.
- [ ] Registro de al menos un autor en la conferencia (con el pago hecho por la persona que corresponda, fuera de este repo).

## Después de subir

- [ ] Etiqueta en Git del estado entregado: `git tag -a v1-camera-ready -m "Versión entregada"` y `git push origin v1-camera-ready`.
- [ ] Guardar aquí el correo de confirmación de la plataforma, sin datos personales.
