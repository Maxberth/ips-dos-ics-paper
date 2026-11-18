# Observaciones de los revisores

- [`observaciones_icits27.md`](observaciones_icits27.md): matriz de observaciones del revisor de ICITS'27 (submission 418), resumidas y numeradas del 0 al 26, con severidad, recomendación y plan. Es una copia completa, sin recortar, de `ips-dos-ics-lab/docs/observaciones_icits27.md`. Las rutas que menciona (`ips-extracted/main.tex`) son de antes de reorganizar: ese archivo es hoy [`actual/main.tex`](../actual/main.tex).
- [`registro_cambios.md`](registro_cambios.md): qué se cambió en el paper por cada observación y en qué commit, o «pendiente».

## Texto original de los revisores

El texto literal de los comentarios de los revisores está en el correo de aceptación de la conferencia (no se versiona aquí). La matriz de arriba los resume y numera del 0 al 26.

## Cómo mantenerlo

1. Al resolver una observación, haz un commit cuyo mensaje diga `(obs. N)`.
2. Añade el hash a la fila N de `registro_cambios.md` y cambia el estado.
3. Si la observación se actualiza en el laboratorio, copia de nuevo `observaciones_icits27.md` desde `ips-dos-ics-lab/docs/`.
