# Figuras

Todas las figuras del paper las genera el laboratorio ([`ips-dos-ics-lab`](https://github.com/Maxberth/ips-dos-ics-lab), etiqueta `icits27-camera-ready`) con `lab/analysis/figuras_paper.py` y `lab/analysis/figuras_arquitectura.py`, desde los datos crudos, al ancho de LNCS y en PDF vectorial. Aquí solo se copian; **no se editan a mano**: si algo cambia, se regenera en el laboratorio y se vuelve a copiar.

| Archivo | Figura del paper | Origen en el laboratorio |
|---|---|---|
| `a0_logical_topology.pdf` | Fig. 1, topología propuesta | `figures/paper/a0_logical_topology` |
| `a1_topology.pdf` | Fig. 2, banco de pruebas y medición | `a1_topology` |
| `a2_ips_datapath.pdf` | Fig. 3, ruta de datos del IPS | `a2_ips_datapath` |
| `r1_availability.pdf` | Fig. 4, disponibilidad | `r1_availability` |
| `r3_availability_timeseries.pdf` | Fig. 5, serie por segundo | `r3_availability_timeseries` |

Las tablas (`tables/t_*.tex`) salen de `lab/analysis/tablas_paper.py`. Las capturas de pantalla y las figuras de la versión inicial (acmart) se retiraron porque sus resultados no se conservan; los originales siguen en `actual/Imagenes/`.

En `main` (formato `acmart`) las figuras son las de `figures/paper_acm/` del laboratorio, generadas con `--layout acm`: ancho de columna (3,3 in) o de página (7 in), siempre con letra de al menos 6 pt. La rama `respaldo-main` usa las de `figures/paper/` (ancho de LNCS, 4,8 in).
