# Executable Tutorials

A repository demonstrating one way to manage and distribute interactive tutorials.
See the [Guide to Contributing](https://scentific-python.org/executable-tutorials/contributing.html)
for a good overview of what this is like to use.

## Demo Links

- **[Tutorials](https://github.com/scientific-python/executable-tutorials/tree/main/tutorials)** are written in MyST Markdown.
- Tutorials can be easily edited as notebooks in JupyterLab.
- Executed tutorials are **[published](https://scientific-python.github.io/exeuctable-tutorials/)** on a GitHub Pages site.
- **[Jupyter Lite (beta)](https://scientific-python.github.io/executable-tutorials/jupyterlite/lab/index.html)** (works only on the basic executable example so far, missing dependencies for others)
- **[Binder](https://mybinder.org/v2/gh/scientific-python/executable-tutorials/notebooks)**


## Goals

- Make content easy to explore and try in a variety of modes:
  - interactive and non-interactive
  - local and cloud-based
  - Jupyter and not-Jupyter
- Document an accessible development workflow, so that non-experts can contribute.
- Keep the infrastructure as simple as possible.

## To Do

- Test execution _of changed tutorials only_ in CI on PR.
- Set up devcontainer.
- Add example with additional dependencies.

## Prior Art

Examples that this is drawing from:

- https://github.com/Caltech-IPAC/irsa-tutorials
- https://github.com/MotherDuck-Open-Source/sql-tutorial
