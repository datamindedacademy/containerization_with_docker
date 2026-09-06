# Containerization with Docker: the slide deck

The course slides, written in [Slidev](https://sli.dev) with the Dataminded theme.
Migrated from `Docker training Winter School 2026.pdf`, following the exercise sequence in the
[repo README](../README.md) (`content/exercise_1` through `content/exercise_7`).

## Layout

| Path                     | What it is                                                                                       |
| ------------------------ | ------------------------------------------------------------------------------------------------ |
| `slides.md`              | The deck. Speaker notes live in the HTML comments.                                               |
| `theme-preview.md`       | One slide per theme layout and component — a visual reference, not part of the real deck.        |
| `style.css`              | Global CSS: exercise-path badge, layer stack, host/container diagram, cheatsheet grid, ladder.   |
| `theme/`                 | The `slidev-theme-dataminded` sources, linked from `package.json`.                               |
| `public/assets-preview/` | Copies of `theme/assets/`, used only by `theme-preview.md` (Slidev can't serve files outside `public/`). |

## Working on the deck

```bash
cd docs
npm install        # once
npm run dev        # live preview on localhost:3030, press "p" for presenter mode
npm run export     # writes Containerization-with-Docker.pdf next to slides.md
npm run build      # static site in dist/
npm run preview    # browse every layout/component in theme-preview.md
```

## Conventions

- Headings are two-tone: wrap the accent word in `<span class="dm-accent">...</span>`.
- Content slides use `layout: default` with a `label:` for the top-right tag. The label is the
  section name (`5 · Writing Dockerfiles`) and stays constant between section dividers.
- Dividers use `layout: section`, exercise pointers use `layout: statement` — each exercise slide
  names the exact folder in `../content/` so students can find it immediately.
- Components (`DmColumns`, `DmProcess`/`DmPhase`, `DmBanner`, `DmSteps`, `DmImpact`) come from the
  theme. The reference deck lives in
  [datamindedbe/playground-agentic-slides](https://github.com/datamindedbe/playground-agentic-slides).
- No emdashes, and bold marks a single term rather than a whole claim.
- Progressive builds use single slides with `v-click`/code-block step ranges (`{all|1-2|4-6|all}`).
  `slidev export` flattens clicks to their final state, so the range list always ends in `all`.
- `style.css` is loaded once at startup. After editing it, restart the dev server; hot reload
  does not pick it up.
- Slides render at 980x552 CSS pixels. Anything taller silently overflows the page in the PDF
  export, so check the export after adding a long code block or table. Long YAML samples use the
  `tight-code` wrapper.
- Exercise numbering must match the folders under `../content/`, which are the source of truth.

## Deviations from the original PDF

Fixed while migrating, because the original would have students copy commands that fail:

- Port publishing is `-p` / `--publish`, not `--expose <host>:<container>`. `EXPOSE` only documents
  a port; it maps nothing.
- `docker tag <source>:<tag> <target>:<tag>` has no `-t` flag.
- The final argument of `docker build` is the **build context**, not the path to the Dockerfile
  (that is `-f`).
- Registry images are not immutable: tags move, only digests are stable.
- Exercises 2 and 3 are labelled after the folders (`exercise_2` = nginx webserver,
  `exercise_3` = interact with running containers); the old deck had them swapped.
- The Java exercise is Exercise 5, not a second Exercise 4.
- Compose is shown as `docker compose` with no `version:` key (both obsolete in the original).
