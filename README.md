## Build

To compile the notes to PDF:

```
make pdf
```

This invokes `latexmk -pdf -interaction=nonstopmode main.tex`. To remove build
artifacts, run:

```
make clean
```

## Theorem environments

The project uses `amsthm` with per-section numbering. The `theorem`, `lemma`,
and `corollary` environments share one counter in the default "plain" style.
The `definition`, `remark`, and `example` environments use the "definition"
style and share the same counter. To add a new environment, declare it in the
preamble referencing `[theorem]` to keep the numbering consistent.

## Common pitfalls

- Always `\label` statements and reference them with `\ref` to avoid broken
  links.
- `latexmk` handles bibliographies and cross-references; re-run the build if
  references appear as `??`.
- Watch the build log for overfull/underfull box warnings and adjust wording or
  line breaks as needed.

