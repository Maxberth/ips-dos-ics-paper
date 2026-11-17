# Registro de cambios por observación

Cada fila es una observación de `observaciones_icits27.md` (misma numeración) y dice qué se cambió en el paper y en qué commit.
«Pendiente» significa que no se ha tocado. Las que dicen «depende del laboratorio» necesitan datos nuevos de [`ips-dos-ics-lab`](https://github.com/Maxberth/ips-dos-ics-lab). Las que dicen «texto» o «decisión» se pueden hacer sin laboratorio, pero cambian afirmaciones del paper y las tiene que decidir el equipo.

Para ver el cambio exacto de un commit: `git show <hash>`.

| # | Observación (resumida) | Cambio hecho en el paper | Commit | Estado |
|---|---|---|---|---|
| 0 | Plantilla ACM, no Springer LNCS | `main.tex` nuevo con `llncs` (`runningheads`), `\institute`, `\email`, `\keywords` con `\and`, bibliografía `splncs04`. Se añadieron `llncs.cls` y `splncs04.bst` al repo. | [`e8ccd5b`](https://github.com/Maxberth/ips-dos-ics-paper/commit/e8ccd5b), [`44942fd`](https://github.com/Maxberth/ips-dos-ics-paper/commit/44942fd) | Resuelta |
| 1 | La regla de Suricata usa `alert`; no demuestra bloqueo | — | — | Pendiente (depende del laboratorio) |
| 2 | UDP en la metodología pero no en los resultados | — | — | Pendiente (depende del laboratorio) |
| 3 | Snort mencionado sin experimento | — | — | Pendiente (depende del laboratorio, o texto si se quita) |
| 4 | El título menciona switches que no se evalúan | — | — | Pendiente (decisión del equipo y laboratorio) |
| 5 | Sin repeticiones, DE ni IC | — | — | Pendiente (depende del laboratorio) |
| 6 | Datos crudos y separación de tráfico legítimo | — | — | Pendiente (depende del laboratorio) |
| 7 | Fórmula de throughput y definición de latencia | — | — | Pendiente (texto; cambia fórmulas) |
| 8 | Definición de la tasa de detección | — | — | Pendiente (texto, depende de cómo se mida) |
| 9 | Novedad poco clara | — | — | Pendiente (texto) |
| 10 | Efecto de Suricata no separado del de firewall/VLAN | — | — | Pendiente (depende del laboratorio) |
| 11 | Falta detalle experimental | — | — | Pendiente (depende del laboratorio) |
| 12 | Método redactado en futuro | — | — | Pendiente (texto) |
| 13 | Redacción y terminología | Parte mecánica: `\text{Where:}` → `\noindent\textbf{Where:}`, «Scenery» → «Scenario», encabezado «Escenario 1» → «Scenario 1», «Attack Behavior» como encabezado y guiones unificados. | [`ef40585`](https://github.com/Maxberth/ips-dos-ics-paper/commit/ef40585) | Parcial: falta la revisión de inglés |
| 14 | Referencias duplicadas | `References.bib` → `references.bib`. `Raman2021ML` se fusionó en `Raman2021ICS` y se actualizó el `\cite`. `Yu2019Ethernet`, `Yu2019IDS` y `sayegh2019ids` comparten título y DOI con autores distintos: quedan marcadas con `% VERIFICAR DOI` sin decidir cuál es la correcta. `Modbus2025IDS` no tiene autor: marcada con `% VERIFICAR AUTOR`. | [`f653a1c`](https://github.com/Maxberth/ips-dos-ics-paper/commit/f653a1c) | Parcial: falta verificar los DOI y el autor |
| 15 | «Yung et al.» en vez de «Yu et al.» | Corregido en §2. | [`7dd39ba`](https://github.com/Maxberth/ips-dos-ics-paper/commit/7dd39ba) | Resuelta |
| 16 | Etiquetas de figura duplicadas y con espacios | Las 16 figuras de resultados tienen ahora etiquetas `fig:` únicas en kebab-case. LaTeX ya no avisa de duplicados. | [`f8ef56c`](https://github.com/Maxberth/ips-dos-ics-paper/commit/f8ef56c) | Resuelta |
| 17 | Caption equivocado en la figura de la regla de bloqueo | «Latency and packet loss with IPS» → «IPS blocking rule». | [`1b38940`](https://github.com/Maxberth/ips-dos-ics-paper/commit/1b38940) | Resuelta |
| 18 | Números de figura escritos a mano | Las cinco referencias («Figure 12/13/15/16/17») usan ahora `\ref`. Las de latencia y pérdida de paquetes apuntaban a números equivocados. | [`5b7e58c`](https://github.com/Maxberth/ips-dos-ics-paper/commit/5b7e58c) | Resuelta |
| 19 | Figura «PerformanceCurve» conceptual | — | — | Pendiente (quitarla o medir en el laboratorio) |
| 20 | «Automatic blocking enabled» sin evidencia | — | — | Pendiente (depende del laboratorio, ver obs. 1) |
| 21 | Unidades mezcladas (% vs. pp) | — | — | Pendiente (texto/tablas de resultados) |
| 22 | Comandos de Scapy y Modbus sin detallar | — | — | Pendiente (depende del laboratorio) |
| 23 | «Significativo» sin prueba estadística | — | — | Pendiente (texto, o laboratorio si se hace la prueba) |
| 24 | Limitaciones de la virtualización | — | — | Pendiente (texto) |
| 25 | Título y abstract no alineados con lo medido | — | — | Pendiente (decisión del equipo, ver obs. 4) |
| 26 | Restos de la plantilla anterior | Fuera `% ACM DL Format`, `\let\Bbbk\relax`, `\shortauthors`, `\setcopyright`, `\acmYear`, babel en español, `\captionsetup` y los renombres de `\tablename`/`\thetable`. | [`44942fd`](https://github.com/Maxberth/ips-dos-ics-paper/commit/44942fd) | Resuelta |

## Otros cambios de formato (sin número de observación)

| Cambio | Commit |
|---|---|
| Figuras copiadas a `figures/` con nombres sin espacios ni tildes (mapa en `figures/README.md`) | [`c060593`](https://github.com/Maxberth/ips-dos-ics-paper/commit/c060593) |
| Tabla «Topology of TCP SYN Flood Scenario» ajustada al margen de una columna (se salía 162 pt), sin cambiar su contenido | [`8dc5b75`](https://github.com/Maxberth/ips-dos-ics-paper/commit/8dc5b75) |
