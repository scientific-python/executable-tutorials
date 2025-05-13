# Executable Tutorials

## Use Cases

Many organizations maintain collections of tutorials addressing realistic
problems in a science domain, with runnable code examples written and
kept current by experts in the tools. They are useful as:

- A trove of working snippets to copy and paste
- A maintained resource for self-guided learning
- A ready-to-use curriculum for interactive workshops
- A suite of science domain-specific "integration tests"

## Key Features

This repository demonstrates one way to configure a collection of tutorials,
covering some core features:

- Source is in [MyST Markdown][] which is easy for humans to edit and review.
- The executed examples---code and results---are published as a static site.
  ([example][static site example])
- The examples can be opened as Jupyter notebooks to run and edit:
  - In a user's local environment
  - On a Binder ([example][binder example])
  - (Experimental) In the user's browser via Jupyter Lite ([example][jupyterlite example])
- The examples can be tested using `pytest`, both locally and on CI.

The repository also includes a [Guide to Contributing][] tutorials. This
provides for a good overview of what this is like to use.

[Myst Markdown]: https://mystmd.org/guide/typography
[static site example]: https://scientific-python.github.io/exeuctable-tutorials/
[binder example]: https://mybinder.org/v2/gh/scientific-python/executable-tutorials/main
[jupyterlite example]: https://scientific-python.github.io/executable-tutorials/jupyterlite/lab/index.html
[Guide to Contributing]: https://scentific-python.org/executable-tutorials/contributing.html
