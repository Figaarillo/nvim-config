# Obsidian en nvim

> Cerrá con `q`. Todo vive bajo `<leader>o` (which-key te lo muestra).

## La idea

- **Una nota = un concepto.** "Transformada de Laplace", no "Clase 7".
- **Linkeá siempre** con `[[` → autocompleta notas (o crea una nueva).
- **Backlinks** (`<leader>ob`) = quién menciona esta nota. Ahí está el valor.

## Flujo diario

1. `<leader>ot` → nota de hoy. Volcá todo sin ordenar (bandeja de entrada).
2. Seleccioná un bloque en visual → `<leader>oe` → se vuelve nota propia + link.
3. `<CR>` sobre `[[link]]` para entrar, `<C-o>` para volver.
4. Checklists `- [ ]` → `<CR>` o `<leader>ox` para marcar.

## Repasar / encontrar

| Tecla          | Qué hace                      |
| -------------- | ----------------------------- |
| `<leader>oq`   | Saltar a cualquier nota       |
| `<leader>os`   | Grep en todo el vault         |
| `<leader>og`   | Listar por tags (`#vocab`)    |
| `<leader>ob`   | Backlinks de la nota actual   |
| `<leader>ol`   | Links salientes de la nota    |
| `<leader>oc`   | Índice (headings)             |
| `[o` / `]o`    | Link anterior / siguiente     |

## Crear / editar

| Tecla               | Qué hace                         |
| ------------------- | -------------------------------- |
| `<leader>on`        | Nota nueva                       |
| `<leader>oN`        | Nota nueva desde template        |
| `<leader>oT`        | Insertar template                |
| `<leader>or`        | Renombrar (actualiza los links)  |
| `<leader>op`        | Pegar imagen del portapapeles    |
| visual `<leader>oe` | Extraer selección a nota nueva   |
| visual `<leader>ok` | Linkear selección a nota         |
| visual `<leader>oK` | Linkear selección a nota nueva   |

## Dailies y vaults

| Tecla                         | Qué hace                 |
| ----------------------------- | ------------------------ |
| `<leader>ot` / `oy` / `om`    | Hoy / ayer / mañana      |
| `<leader>od`                  | Lista de dailies         |
| `<leader>ow`                  | Cambiar de vault         |

## Dentro del picker (fzf)

- `<C-x>` crear nota con lo que escribiste
- `<C-l>` insertar link a la nota seleccionada

## Regla de oro

No configures más hasta que algo se te repita 3 veces. **Escribí primero.**
