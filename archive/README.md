# Site archive

This folder's contents are excluded from Jekyll builds by `exclude: ["archive/**"]` in
`_config.yml`. Files here are kept in Git but are not published on the website,
even if they contain front matter or a permalink.

- `pages/`: retired versions of pages and News fragments.
- You can add `drafts/` for unused prose and other working notes.

This is not private storage: tracked files remain visible in a public repository.
For notes inside active pages, use `{% comment %} ... {% endcomment %}` instead
of HTML comments so they do not appear in the generated page source.

The active `_pages/news_v2.md` is separately excluded from direct copying;
the homepage still renders it through `include_relative`.
