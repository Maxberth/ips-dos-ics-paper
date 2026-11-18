# Registro de cambios por observación

Cada fila es una observación de `observaciones_icits27.md` (misma numeración) y dice qué se cambió en el paper y en qué commit.
«Pendiente» significa que no se ha tocado. Las que dicen «depende del laboratorio» necesitan datos nuevos de [`ips-dos-ics-lab`](https://github.com/Maxberth/ips-dos-ics-lab). Las que dicen «texto» o «decisión» se pueden hacer sin laboratorio, pero cambian afirmaciones del paper y las tiene que decidir el equipo.

Para ver el cambio exacto de un commit: `git show <hash>`.

| # | Observación (resumida) | Cambio hecho en el paper | Commit | Estado |
|---|---|---|---|---|
| 0 | Plantilla ACM, no Springer LNCS | `main.tex` nuevo con `llncs` (`runningheads`), `\institute`, `\email`, `\keywords` con `\and`, bibliografía `splncs04`. Se añadieron `llncs.cls` y `splncs04.bst` al repo. | [`e8ccd5b`](https://github.com/Maxberth/ips-dos-ics-paper/commit/e8ccd5b), [`44942fd`](https://github.com/Maxberth/ips-dos-ics-paper/commit/44942fd) | Resuelta |
| 1 | La regla de Suricata usa `alert`; no demuestra bloqueo | §4.3 con las reglas `drop` reales y la ruta inline (nftables → NFQUEUE → Suricata); la afirmación de bloqueo se respalda con los contadores y la captura (§5.2). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 2 | UDP en la metodología pero no en los resultados | El UDP flood se incluye en el método (§3, §4.4) y en todos los resultados (§5). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 3 | Snort mencionado sin experimento | Snort se quita de la comparación: §3.5 aclara que no se evaluó y §5.6 y §6 lo declaran como trabajo futuro. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 4 | El título menciona switches que no se evalúan | Título «…Based on PLC Protection and VLAN Segmentation» y abstract con el alcance real (switch virtual, evaluación centrada en el servicio del PLC). **Confirmar con la conferencia que se acepta el cambio de título.** | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta (confirmar título) |
| 5 | Sin repeticiones, DE ni IC | 10 repeticiones por combinación, media ± IC 95 %, Mann-Whitney con corrección de Holm, delta de Cliff y Fisher exacto (§3.6, §5.3, Tabla 4). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 6 | Datos crudos y separación de tráfico legítimo | Definición de tráfico legítimo y malicioso (§3.4) y enlace a los datos crudos y los scripts (Disponibilidad de datos y código). **Falta hacer públicos los repositorios.** | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta (repos por publicar) |
| 7 | Fórmula de throughput y definición de latencia | El throughput se elimina como métrica (§3.4); el RTT se define como tiempo de ida y vuelta con reloj monotónico. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 8 | Definición de la tasa de detección | Detección por corrida (80/80) y por paquete solo donde es comparable; UDP por flujo (§3.4, §5.5). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 9 | Novedad poco clara | Párrafo de contribuciones (§1) y «Related Work and Positioning» (§2.5), con referencias disponibles; sin comparación cuantitativa con otros sistemas. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Parcial |
| 10 | Efecto de Suricata no separado del de firewall/VLAN | Condición E1 (firewall + VLAN sin IPS) frente a E2 y E3 (§3.2, §5). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 11 | Falta detalle experimental | Tabla de VM con VLAN, vCPU y RAM; hardware, versiones, perfil de la corrida y algoritmo del procedimiento (§4). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 12 | Método redactado en futuro | Método y arquitectura en pasado (§3 y §4 reescritos). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 13 | Redacción y terminología | Parte mecánica: `\text{Where:}` → `\noindent\textbf{Where:}`, «Scenery» → «Scenario», encabezado «Escenario 1» → «Scenario 1», «Attack Behavior» como encabezado y guiones unificados. | [`ef40585`](https://github.com/Maxberth/ips-dos-ics-paper/commit/ef40585) | Parcial: falta la revisión de inglés |
| 14 | Referencias duplicadas | `References.bib` → `references.bib`. `Raman2021ML` se fusionó en `Raman2021ICS` y se actualizó el `\cite`. `Yu2019Ethernet`, `Yu2019IDS` y `sayegh2019ids` comparten título y DOI con autores distintos: quedan marcadas con `% VERIFICAR DOI` sin decidir cuál es la correcta. `Modbus2025IDS` no tiene autor: marcada con `% VERIFICAR AUTOR`. | [`f653a1c`](https://github.com/Maxberth/ips-dos-ics-paper/commit/f653a1c) | Parcial: falta verificar los DOI y el autor |
| 15 | «Yung et al.» en vez de «Yu et al.» | Corregido en §2. | [`7dd39ba`](https://github.com/Maxberth/ips-dos-ics-paper/commit/7dd39ba) | Resuelta |
| 16 | Etiquetas de figura duplicadas y con espacios | Las 16 figuras de resultados tienen ahora etiquetas `fig:` únicas en kebab-case. LaTeX ya no avisa de duplicados. | [`f8ef56c`](https://github.com/Maxberth/ips-dos-ics-paper/commit/f8ef56c) | Resuelta |
| 17 | Caption equivocado en la figura de la regla de bloqueo | «Latency and packet loss with IPS» → «IPS blocking rule». | [`1b38940`](https://github.com/Maxberth/ips-dos-ics-paper/commit/1b38940) | Resuelta |
| 18 | Números de figura escritos a mano | Las cinco referencias («Figure 12/13/15/16/17») usan ahora `\ref`. Las de latencia y pérdida de paquetes apuntaban a números equivocados. | [`5b7e58c`](https://github.com/Maxberth/ips-dos-ics-paper/commit/5b7e58c) | Resuelta |
| 19 | Figura «PerformanceCurve» conceptual | La figura conceptual se elimina; la sustituye la serie temporal medida por segundo (Fig. 5). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 20 | «Automatic blocking enabled» sin evidencia | La afirmación de bloqueo sale de las reglas `drop` y los contadores de la condición E3 (§5.2). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 21 | Unidades mezcladas (% vs. pp) | Las tablas informan % de respuestas y de paquetes eliminados, sin columnas de «mejora» en puntos o porcentaje. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 22 | Comandos de Scapy y Modbus sin detallar | Comandos exactos de `hping3` y descripción del generador Modbus en §4.4. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 23 | «Significativo» sin prueba estadística | «Significativo» solo donde hay prueba (Tabla 4); el resto se describe con efecto y no concluyente. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 24 | Limitaciones de la virtualización | Limitaciones de la virtualización en §5.6 y §6. | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta |
| 25 | Título y abstract no alineados con lo medido | Título y abstract alineados con lo medido (ver obs. 4). | [`0788893`](https://github.com/Maxberth/ips-dos-ics-paper/commit/0788893) | Resuelta (confirmar título) |
| 26 | Restos de la plantilla anterior | Fuera `% ACM DL Format`, `\let\Bbbk\relax`, `\shortauthors`, `\setcopyright`, `\acmYear`, babel en español, `\captionsetup` y los renombres de `\tablename`/`\thetable`. | [`44942fd`](https://github.com/Maxberth/ips-dos-ics-paper/commit/44942fd) | Resuelta |

## Otros cambios de formato (sin número de observación)

| Cambio | Commit |
|---|---|
| Figuras copiadas a `figures/` con nombres sin espacios ni tildes (mapa en `figures/README.md`) | [`c060593`](https://github.com/Maxberth/ips-dos-ics-paper/commit/c060593) |
| Tabla «Topology of TCP SYN Flood Scenario» ajustada al margen de una columna (se salía 162 pt), sin cambiar su contenido | [`8dc5b75`](https://github.com/Maxberth/ips-dos-ics-paper/commit/8dc5b75) |
