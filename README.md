# Executable Tutorials

## Use Cases

Many organizations maintain collections of tutorials addressing realistic
problems in a science domain, with runnable code examples written and
kept current by experts in the tools. They are useful as:

- A trove of working snippets to copy and paste
- A maintained resource for self-guided learning
- A ready-to-use curriculum for hands-on workshops
- A suite of science domain-specific "integration tests" for the showcased libraries

## Key Features

This repository demonstrates one way to configure a collection of tutorials,
covering some core features:

- Source is in [MyST Markdown][] which is easy for humans to edit and review.
- The executed examples—code and results—are published as a
  [static site][static site example].
- The examples can be opened as Jupyter notebooks to run and edit:
  - In a user's local environment
  - In the cloud using [Binder][binder example]
  - (Experimental) In the user's browser via a [Jupyter Lite app][jupyterlite example]
- The examples can be tested using `pytest`, both locally and on CI.

## Try It Out

- Read the [published examples][static site example].

- Open it on [Binder][binder example] to run the examples in the cloud.

- Download and run the examples locally.

  ```sh
  git clone https://github.com/scientific-python/executable-tutorials
  ```

  For users of [pixi][]:

  ```sh
  pixi run start
  ```

  Alternatively, install the requirements with pip and start JupyterLab.

  ```sh
  pip install -r requirements.txt
  jupyter lab
  ```
## Build the site

There are currently two distinct technology stacks that support the
`executable-tutorials` paradigm: a legacy sphinx-based static-site generation
engine, and the newer [myst][myst-org] project.
The `executable-tutorials` repo contains information about both development
patterns, and endeavors to serve as a transition guide between technology
stacks.

By default, the necessary tooling for both technology stacks is installed with
`pip install -r requirements.txt`

### Build with sphinx

```bash
make html
```

The static site can then be viewed by simply opening the index in any browser,
for example::

```bash
firefox _build/html/index.html
```

### Build with `myst`

```bash
myst start --execute
```

This will execute the notebooks, build the site, and set up a server for rendering
the site.
The rendered page can be viewed by opening `localhost:3000` in a browser.

## Make Your Own

See the [Guide for Maintainers][] to create your own collection of tutorials.

[Myst Markdown]: https://mystmd.org/guide/typography
[static site example]: https://scientific-python.github.io/executable-tutorials/
[binder example]: https://mybinder.org/v2/gh/scientific-python/executable-tutorials/main
[jupyterlite example]: https://scientific-python.github.io/executable-tutorials/jupyterlite/lab/index.html
[pixi]: https://pixi.sh/
[Guide for Maintainers]: https://scientific-python.github.io/executable-tutorials/maintainer-guide.html
