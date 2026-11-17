# Procedencia de `actual/`

Esta carpeta guarda la versión del paper tal como se envió a ICITS'27 (submission 418), con la plantilla ACM (`acmart`).
Es la referencia del «antes»: **no se edita**. Todos los cambios se hacen en la raíz del repositorio (`main.tex`, `sections/`, `figures/`, `references.bib`).

## Origen

- Archivo original: `actual/original/Implementation_of_Intrusion_Prevention_Systems__IPS_.zip`
  - Tamaño: 3 582 223 bytes
  - SHA-256: `b62572ec7659b3efbc011d061de25f1dc4a812815fad648d9d5cc15751a3b147`
  - Fecha del archivo en disco: 2026-11-16 10:55 (hora de Perú)
- El zip se descomprimió sin cambios en esta carpeta; `main.tex`, `References.bib` e `Imagenes/` son su contenido.
- `main.pdf` no viene en el zip: se compiló localmente el 2026-11-16 a las 11:02 a partir de ese mismo `main.tex`, con `acmart`.
- Fecha de registro en Git: 2026-11-17, commit inicial `d4c4ea7`, etiqueta `v0-acmart-original`.

## Huellas SHA-256

| Archivo | SHA-256 |
|---|---|
| `main.tex` | `241b34fa12410518f1db28129434dedb3a9375facd8d006f1f54784885d9b1b7` |
| `References.bib` | `149e4d68862c581ec13980c6eb3b426015f3f0ee7e7af419722c59860fd3e51c` |
| `main.pdf` | `dbf2ce2a81a03e5967fd86f1963b6eb0f26f7e9fa4ed43bcd291c5cf0d6d002b` |

`main.tex` y `References.bib` tienen el mismo hash que sus copias dentro del zip.

## Cómo comprobarlo

```bash
sha256sum actual/original/*.zip actual/main.tex actual/References.bib actual/main.pdf
git diff v0-acmart-original -- actual/   # solo debe aparecer este archivo
```
