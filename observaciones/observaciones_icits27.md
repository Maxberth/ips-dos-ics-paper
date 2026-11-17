# ICITS'27 (submission 418): matriz de observaciones y plan de subsanación

**Artículo:** Implementation of an Intrusion Prevention System for Mitigating DoS Attacks in Industrial Control Networks Based on PLC and Industrial Switch Protection
**Estado:** aceptado como Full Paper. Versión final (camera-ready) a subir **antes del 18 de noviembre de 2026**.
**Fuente del código LaTeX:** `/home/maxberth/code/articulo/ips-extracted/main.tex`

---

## 0. Resumen crítico (leer primero)

1. **Plantilla incorrecta.** El documento usa la clase `acmart` (ACM). Springer exige la clase LNCS (`llncs`), que ya está instalada en el equipo (`llncs.cls`, `splncs04.bst`). Cambiar la plantilla es obligatorio y altera maquetación, bibliografía y longitud; hay que hacerlo primero.
2. **La prevención no está demostrada.** La regla de Suricata del §4.3 usa `alert`, que solo genera alertas. El revisor lo señala como el punto más grave, porque la afirmación central es mitigación automática. Hay que mostrar reglas de bloqueo reales (`drop`, con NFQUEUE en modo inline) y evidencia de paquetes descartados.
3. **Faltan experimentos prometidos.** Se describen cuatro escenarios de ataque (SYN, ICMP, UDP, Modbus) pero solo se reportan tres. Snort aparece como herramienta comparativa y no tiene experimento. El título menciona protección de switches industriales y no se evalúa el switch.
4. **Estadística insuficiente.** Cada cifra es una sola medición. No hay repeticiones, desviación estándar ni intervalos de confianza.
5. **Texto y figuras.** Hay etiquetas de figura duplicadas, una figura con el caption equivocado, bibliografía duplicada, un error de autor (“Yung” por “Yu”), y secciones redactadas en futuro (“will be”, “will follow”).

**Qué es realista en dos días:** la corrección de plantilla, la bibliografía, las etiquetas, las definiciones de métricas y la reformulación de afirmaciones son factibles hoy. Los experimentos nuevos (UDP, Snort, reglas drop, 10 repeticiones) dependen del hardware disponible; ver §3. Si no alcanzan, la salida honesta es reducir las afirmaciones del texto y declarar las limitaciones, en vez de publicar datos sin respaldo.

**Enfoque FOSS (nuevo):** el paper se plantea como evaluación de alternativas de software libre (Suricata, OpenPLC, QEMU/KVM, Open vSwitch, nftables) frente a soluciones con licencia, para industrias locales que no pueden pagar licencias. Esto responde al revisor 7 (contribución) y a la sugerencia de apuntar a industrias locales. **No se afirma que estas herramientas sean más fiables ni mejores** que las comerciales. Lo que sí se declara es que se probaron con el mismo protocolo de medición y que sus resultados valen solo para el entorno de laboratorio descrito (PLC simulado, switch virtual, sin hardware industrial).

---

## 1. Matriz de observaciones

Severidad: **Crítica** (riesgo de rechazo o de afirmación falsa), **Alta** (el revisor lo pedirá de nuevo), **Media** (calidad), **Baja** (cosmética).
Esfuerzo: **S** (≤2 h), **M** (½ día), **L** (más de 1 día o requiere laboratorio).
Tipo de corrección: **T** texto, **E** experimento nuevo, **F** figura o tabla, **R** referencias, **P** plantilla.

| # | Observación del revisor (resumida) | Dónde afecta (main.tex) | Sev. | Recomendación concreta | Tipo | Esfuerzo | Prioridad |
|---|---|---|---|---|---|---|---|
| 0 | Plantilla ACM (`acmart`), no Springer | Preámbulo, líneas 2–25; `\maketitle`, `\keywords`, `\begin{abstract}` | Crítica | Cambiar a `\documentclass{llncs}`, adaptar autores y afiliaciones al formato LNCS, `\institute{}` y `\email{}`, bibliografía con `splncs04.bst`. Quitar `acmart`, `\setcopyright`, `\acmYear`. | P | M | 1 |
| 1 | Regla de Suricata usa `alert`; no demuestra bloqueo | §4.3 “IPS Configuration” (bloque verbatim con `alert tcp ... sid:100001`); Tabla “IPS Configuration Parameters”, fila “Automatic Blocking” | Crítica | Escribir reglas `drop` y mostrar el modo inline con NFQUEUE (`suricata -q 0` con `iptables -j NFQUEUE`). Presentar una regla de SYN flood basada en `flow`/`threshold` y otra para Modbus (`drop`). Incluir la salida de `eve.json` con eventos `drop`. | E + T | L | 1 |
| 2 | Hay cuatro escenarios en metodología y solo tres en resultados (UDP ausente) | Abstract; §3.2 (Tabla “Experimental Attack Scenarios”); §4.4 (Escenarios 1–3); §5 (solo Escenarios 1–3) | Crítica | Ejecutar el escenario UDP Flood (`hping3 --udp --flood -p 502` o similar), con las mismas 10 repeticiones y las mismas métricas. Si no se logra, retirar UDP del abstract y de la metodología, y justificar la exclusión en una frase. | E / T | M–L | 2 |
| 3 | Snort se menciona como comparativa pero no hay experimento | §3.3 (Tools, Snort); Tabla “Components” (IPS Suricata/Snort) | Alta | Opción A: ejecutar el mismo ataque con Snort en modo inline (`snort -Q`, reglas `drop`) y comparar. Opción B: quitar Snort de la comparación y describirlo solo como alternativa en la discusión, sin afirmar resultados. | E / T | L (A) / S (B) | 3 |
| 4 | El título habla de switches industriales, pero no se evalúan | Título; abstract; §5 (sin medición del switch) | Alta | Decisión del equipo: usar **Open vSwitch** como switch virtual (ya decidido) y declararlo así en el paper: switch virtual 802.1Q, medición de segmentación y aislamiento, no hardware de switch industrial. Cambiar el título a “…Based on PLC Protection” o mantener “switch” con la aclaración en §4.2. Medir contadores por puerto con `ovs-ofctl dump-ports` durante el ataque. | T + E | S | 2 |
| 5 | Resultados sin repeticiones, sin desviación estándar ni intervalos de confianza | Tablas de resultados (SYN, Modbus, ICMP); figuras de comparación; Fig. “PerformanceCurve” | Crítica | Repetir cada escenario al menos 10 veces (con y sin IPS). Reportar media ± DE y IC 95 % (t de Student con n−1 grados de libertad). Añadir columnas o notas de tabla. Si el tiempo no alcanza, declarar n=1 y no hablar de “significancia”. | E / F | L | 1 |
| 6 | Datos crudos, cómo se separó tráfico legítimo de tráfico descartado | §3.4 Métricas (Packet Loss, Availability); §5 | Alta | Publicar (en repositorio o material suplementario) los CSV de `ping`/`iperf`/capturas de Wireshark. Definir: “tráfico legítimo” = paquetes Modbus de SCADA a PLC con respuesta; “malicioso” = paquetes que coinciden con la regla y se descartan (contadores de `drop` en `stats.log`). | T / E | M | 2 |
| 7 | Fórmula de throughput incorrecta; latencia mal definida (RTT vs. una vía) | §3.4 Throughput: `\frac{...}{...} \times 100`; §3.4 Latency: `Receive Time - Send Time` | Alta | Throughput: Mbps = bytes·8 / (tiempo·10⁶); quitar el `×100`. Latencia: definir RTT como `t_respuesta − t_envío` de un `ping`/Modbus request; indicar que es RTT y no una vía. Ajustar la unidad (ms). | T | S | 1 |
| 8 | Definición de tasa de detección ambigua | §3.4 Detection Rate; Tablas de resultados (“Detection Rate 98.9 / 99.3 / 97.8”) | Alta | Definir: detectados = eventos `alert` o `drop` con SID de la regla / ataques ejecutados con la misma duración. Indicar cómo se contaron los ataques (número de paquetes o de sesiones). Aclarar que no es una tasa por paquete si así se midió. | T | S | 2 |
| 9 | Novedad poco clara frente a herramientas ya existentes | Introducción (último párrafo); §2 Background; §4 Case Study | Alta | Añadir un párrafo de contribución explícita: integración de Suricata inline con segmentación Purdue/VLAN y medición de disponibilidad del PLC en un laboratorio virtual reproducible. Añadir una tabla comparativa de 3–4 trabajos (IDS vs. IPS, medición de disponibilidad, inline o no). | T / R | M | 2 |
| 10 | Atribución de resultados: no se separa el efecto de Suricata del de firewall/VLAN | §4.2 (arquitectura); §5 (tablas “With IPS”) | Alta | Añadir un caso intermedio “solo firewall + VLAN, sin IPS” y reportarlo. Si no se mide, decir explícitamente que la mejora se atribuye al conjunto de controles y no solo a Suricata. | E / T | M | 3 |
| 11 | Falta de detalle experimental (hardware, RAM/CPU de VMs, tasas de tráfico, repeticiones, configuración del IPS) | §3.1–3.2 (Experimental Design) y Tabla “Experimental Attack Scenarios” (solo tiene duración y protocolo) | Crítica | Añadir tabla de configuración: CPU, RAM, disco y SO de cada VM (Kali, OpenPLC, SCADA, Suricata, pfSense), versión de Suricata y OpenPLC, tasa de ataque (`pps`), duración, número de repeticiones y herramienta de medición. Ver el documento de requisitos. | T / F | S–M | 1 |
| 12 | Texto del método en futuro (“will be executed”, “will follow”) | §3.1–3.2 (“The experimental design will follow…”, “The IPS will be configured…”, “The experimental infrastructure will simulate…”) | Alta | Cambiar a pasado simple o presente (“The experiments were conducted…”). Revisar todo el §3 y el §4. | T | S | 1 |
| 13 | Errores de redacción, terminología inconsistente, repetición de descripciones | Todo el texto; “Scenery” vs. “Scenario”; “Escenario 1 – TCP SYN Flood” en encabezado; “Attack Behavior” pegado a la línea siguiente; `\text{Where:}` usado en texto normal (§3.4; compila, pero conviene `\textbf`) | Media | Pasar corrector en inglés (idealmente un revisor nativo). Unificar “Scenario”, quitar las palabras en español de los encabezados (“Escenario”, “Results”), separar los párrafos “Attack Behavior”, y reemplazar `\text{Where:}` por `\noindent\textbf{Where:}`. | T | M | 2 |
| 14 | Lista de referencias con entradas duplicadas e inconsistentes | `References.bib`: `Raman2021ICS` y `Raman2021ML` son el mismo artículo (mismos autores, mismo año y revista, título con mayúsculas distintas). `Yu2019Ethernet` y `sayegh2019ids` tienen el mismo título (“A Two Stage Intrusion Detection System … Ethernet/IP”) pero distinto autor. | Alta | Conservar una sola entrada por artículo; verificar cada una con DOI en la fuente original. Actualizar las citas (`\cite{Raman2021ML}` pasa a `\cite{Raman2021ICS}`). Revisar la lista completa contra DOI. | R | M | 2 |
| 15 | Autor citado mal: “Yung et al.” | §2.3 (“According to Yung et al. \cite{Yu2019IDS}”) | Media | Cambiar a “Yu et al.” (el autor del bib es Wenbin Yu). | T | S | 2 |
| 16 | Etiquetas de figura duplicadas (LaTeX lo avisa) | `\label{fig:Latency and packet loss with IPS}` aparece en dos figuras (“latencia y perdidas de paquete con ips.png” y “regla de bloqueo.png”); `\label{fig:TCP SYN Flood to PLC (Port 502)}` aparece en dos figuras (`ESCENARIO_!.png` y `ataque_tcp.png`). Además, las etiquetas con espacios no son válidas en LNCS. | Media | Renombrar con etiquetas sin espacios (`fig:syn_topology`, `fig:syn_attack`, `fig:ips_latency`, `fig:ips_block_rule`, etc.) y actualizar todos los `\ref`. | F | S | 1 |
| 17 | Caption de figura equivocado | `regla de bloqueo.png` tiene el caption “Latency and packet loss with IPS”; debe decir algo como “IPS blocking rule”. | Alta | Corregir el caption al contenido real de la imagen. Comprobar que cada imagen coincida con su texto. | F | S | 1 |
| 18 | Referencias a figuras por número que no coinciden con el texto | §5: “Figure 12 shows…”, “Figure 13 illustrates…”, “Figure 15 shows…”, “Figure 16 demonstrates…”, “Figure 17 summarizes…” | Media | Usar `\ref{}` con etiquetas en vez de números escritos a mano; revisar que cada número apunte a la figura correcta. | F | S | 1 |
| 19 | Figura “PerformanceCurve” es conceptual, no medida | §5 (“Figure 17… normalized experimental averages rather than continuous time-series measurements”) | Alta | Quitarla, o reemplazarla por una serie temporal medida (`ping` continuo, 1 Hz, durante el ataque). Si se conserva, rotularla explícitamente como ilustración. | F | S (quitar) / L (medir) | 2 |
| 20 | Afirmación “automatic blocking enabled” sin evidencia | Tabla “IPS Configuration Parameters”; §5 “…blocked malicious requests…” | Alta | Vincular la afirmación a la evidencia del punto 1 (contadores de `drop`). Si no hay evidencia, cambiar a “alerting enabled; blocking evaluated in future work”. | T | S | 1 |
| 21 | Métricas con unidades mezcladas (“+36.8 %” es en puntos porcentuales) | Tabla “Results of TCP SYN Flood Attack” y las otras dos; columna “Improvement” | Media | Usar “pp” para disponibilidad y detección; “%” para reducción relativa. Explicar la convención en el pie de tabla. | F | S | 2 |
| 22 | Precisión de la atribución de herramientas: `ping -f` y `hping3` correctos, pero “Modbus testing utilities” y “Scapy” sin comando | §4.4 y Figuras “scapygeneration.png”, “mobdus.png” | Media | Incluir el comando exacto usado en las pruebas con Modbus (script de Scapy o herramienta concreta), y la tasa en pps. | T | S | 2 |
| 23 | Afirmaciones “reducción significativa” sin prueba | §5 (“significantly increased”, “significantly reduced”) | Alta | Sustituir “significativo” por “notable” salvo que haya prueba estadística (punto 5). | T | S | 1 |
| 24 | Limitaciones sin mención de virtualización (CPU medida en VM) | §6 (Conclusiones) | Media | Añadir que los valores de CPU de OpenPLC se miden en una VM y no en PLC físico, por lo que no son comparables con hardware real. | T | S | 2 |
| 25 | El resumen menciona “PLC and industrial switch protection” en el título, pero el resumen reporta solo PLC | Abstract | Media | Alinear el título y el abstract con lo que se midió (ver punto 4). | T | S | 1 |
| 26 | Restos de código o marcas de trabajo | `\let\Bbbk\relax` en preámbulo; `% ACM DL Format`, `%\renewcommand{\shortauthors}...`; comentarios en español | Baja | Eliminar comentarios y restos de la plantilla anterior al cambiar a LNCS. | P | S | 3 |

---

## 2. Requisitos de hardware y software para correr el laboratorio

**Nota importante:** en la carpeta del proyecto encontré solo el zip (`main.tex`, figuras y `References.bib`). No hay scripts, archivos de configuración de Suricata, GNS3 ni de OpenPLC. Por eso estas cifras salen de lo que describe el paper (VMs con Kali, OpenPLC, SCADA, Ubuntu Server con Suricata, pfSense; el switch se reemplaza por Open vSwitch). Son **estimaciones** y deben confirmarse con el equipo que hizo las pruebas originales. Si existen los archivos de configuración de su laboratorio, deben cargarse para reproducir el entorno exacto.

### 2.1 Máquinas virtuales (QEMU/KVM con libvirt, switch Open vSwitch)

| Nodo (según el paper) | Función | Mínimo | Recomendado | Software |
|---|---|---|---|---|
| Arch Linux (atacante) | Atacante (`hping3`, `ping -f`, Scapy) | 2 vCPU, 3 GB RAM, 20 GB | 2 vCPU, 4 GB RAM, 30 GB | Arch, `hping3`, Scapy, `iperf3` |
| OpenPLC | PLC simulado (Modbus/TCP, puerto 502) | 1 vCPU, 1 GB RAM, 8 GB | 2 vCPU, 2 GB RAM, 10 GB | OpenPLC Runtime |
| SCADA/HMI | Supervisión | 1 vCPU, 2 GB RAM, 15 GB | 2 vCPU, 4 GB RAM, 20 GB | Cliente Modbus (p. ej. ScadaBR, o script de Python con `pymodbus`) |
| Suricata IPS | Inspección inline (NFQUEUE) | 2 vCPU, 4 GB RAM, 25 GB | 4 vCPU, 8 GB RAM, 40 GB | Ubuntu Server 22.04/24.04, Suricata 7.x, `iptables`/`nftables` |
| Router/firewall (Arch) | Firewall y router entre zonas | 1 vCPU, 1 GB RAM, 8 GB | 2 vCPU, 2 GB RAM, 10 GB | nftables (alternativa: pfSense CE u OPNsense) |
| Monitor/Wireshark | Captura de tráfico (opcional, puede ir en el host) | 1 vCPU, 2 GB RAM | 2 vCPU, 4 GB RAM | Wireshark, `tcpdump`, `tshark` |
| Snort (si se incluye) | Comparativa | 2 vCPU, 2 GB RAM | 2 vCPU, 4 GB RAM | Snort 3.x en modo inline (`-Q`) |

**Total de VMs simultáneas:** mínimo ≈ 9 vCPU y 16 GB de RAM asignables; recomendado ≈ 14 vCPU y 30 GB.

### 2.2 Equipo anfitrión

| Recurso | Mínimo | Recomendado | Motivo |
|---|---|---|---|
| CPU | 8 hilos (4 núcleos + HT) | 12–16 hilos | Los flood (`hping3 --flood`, `ping -f`) saturan un núcleo; Suricata con NFQUEUE también consume CPU. |
| RAM | 16 GB | 32 GB | Con 5–6 VMs más el host, 16 GB quedan justos. |
| Disco | 120 GB libres en SSD | 250 GB SSD | Imágenes de VM, capturas `pcap` (un flood de 5 min puede generar varios GB) y `eve.json`. |
| Red | 1 adaptador NAT + 1 red interna | 2 adaptadores (uno para internet/actualización, otro para el laboratorio) | El laboratorio debe estar aislado de la red de la universidad. |
| SO del anfitrión | Arch Linux con QEMU/KVM y libvirt | Arch Linux, kernel con KVM | Todo FOSS; más estable para floods y medición de tiempos. |

**Software de medición:** `ping` (RTT), `iperf3` o `tshark` para throughput, `ps`/`top` o `pidstat` para CPU de Suricata y OpenPLC, `vmstat`, script de conteo de `drop` a partir de `eve.json` (`jq`). Para estadística: Python 3 con `numpy`, `scipy` y `pandas`.

### 2.3 Versiones a registrar (requisito del revisor)

Registrar en la tabla de configuración del paper: versión de Suricata (p. ej. 7.0.x), versión de OpenPLC Runtime, versión de nftables, versión de QEMU/libvirt, versión de Open vSwitch, versión de Arch Linux, `hping3` y Scapy.

### 2.4 Pasos de levantamiento del entorno

1. Crear las VMs con la tabla de §2.1, con red interna por VLAN (10 IT, 20 DMZ/SCADA, 30 PLC) según la Tabla “Proposed VLAN Segmentation”.
2. Configurar nftables entre VLAN 10 y 20, y Suricata en el puente entre VLAN 20 y 30 (con `nftables`/`iptables` y `NFQUEUE`).
3. Levantar OpenPLC, cargar un programa con el servidor Modbus en el puerto 502.
4. Probar conectividad: `ping` y una consulta Modbus desde SCADA. Confirmar que Suricata ve el tráfico (`eve.json`).
5. Medir la línea base (sin ataque), 10 repeticiones.
6. Ejecutar cada ataque sin IPS y con IPS, 10 repeticiones cada uno.

---

## 3. Plan por prioridad para hoy (16 nov) y mañana (17 nov), entrega el 18 nov

El plan está ordenado por lo que más riesgo quita al artículo. Los pasos de texto (T, R, F) pueden avanzar en paralelo con el laboratorio.

### Bloque A: obligatorio y rápido (hoy, aprox. 3–4 h)

1. **Cambiar a la plantilla LNCS** (obs. 0, 26). Compilar y revisar el número de páginas. Springer pide texto en inglés, así que la plantilla es lo primero. Ya tengo `llncs` instalado.
2. **Corregir errores de LaTeX y figuras**: etiquetas duplicadas (16), caption de la figura de bloqueo (17), referencias a figuras con `\ref` (18), figura conceptual (19), `\text{Where:}` (13).
3. **Bibliografía** (14, 15): unificar `Raman2021ICS`/`Raman2021ML`, revisar `sayegh2019ids` y `Yu2019Ethernet`, y corregir “Yung”.
4. **Fórmulas y métricas** (7, 8): throughput sin `×100`, RTT, definición de detección.
5. **Tiempo verbal y lenguaje** (12, 13, 23): pasado simple y quitar “significativo”.

### Bloque B: experimentos (hoy y mañana)

6. **Reglas de bloqueo reales** (1, 20): montar Suricata en NFQUEUE con reglas `drop` para SYN y Modbus. Verificar con `eve.json` y contadores. **Es el experimento más importante.** Sin esto, la afirmación de “prevención” debe rebajarse en el texto.
7. **Repeticiones con estadística** (5): 10 repeticiones por escenario y condición. Calcular media, DE e IC 95 %. Si no alcanzan, declarar n y no hablar de significancia.
8. **Escenario UDP** (2): una corrida con y sin IPS. Si no hay tiempo, quitar UDP del abstract y la metodología, y justificarlo en una frase.
9. **Snort** (3): si hay tiempo, comparación inline. Si no, quitar Snort de la comparación y dejarlo solo como alternativa descrita.
10. **Datos crudos y métricas de tráfico legítimo** (6): exportar CSV y contadores de descarte.
11. **Atribución: firewall/VLAN vs. Suricata** (10): caso intermedio “sin IPS pero con firewall/VLAN”, si se puede medir. Si no, declarar la limitación.

### Bloque C: cierre (17–18 nov)

12. **Título y abstract** (4, 25): alinearlos con lo medido.
13. **Contribución y comparación** (9): párrafo de novedad y tabla comparativa corta.
14. **Tabla de configuración** (11): VMs, versiones, tasas, repeticiones.
15. **Limitaciones** (24): virtualización y CPU medido en VM.
16. **Revisión final de idioma** (13) y compilación limpia.
17. **Entrega** antes del 18 nov: PDF LNCS, fuentes (`.tex`, `.bib`, figuras), formulario de consentimiento (`copyright.docx`) firmado, registro de un autor en la conferencia (pago fuera de la UE con tarjeta o PayPal).

### Decisión que necesitan tomar Alberth y el equipo hoy

- ¿Se pueden repetir los experimentos con reglas `drop` antes de mañana? Si no, el texto debe reducir la afirmación de “prevención”, y esa decisión la toman ustedes, porque cambia la aportación del artículo.
- ¿Quién tiene el hardware original? Si hay archivos de configuración de Suricata u OpenPLC en otra máquina, conviene copiarlos hoy. Ya no se necesitan los de GNS3 porque el switch será Open vSwitch.

---

## 4. Entregables asociados

- Este archivo: matriz de observaciones (§1), requisitos de hardware (§2) y plan (§3).
- Versión LNCS del `main.tex` y compilación limpia: pendiente de la tarea de plantilla (Bloque A).
- Datos crudos y scripts de medición: pendientes de los experimentos (Bloque B).
