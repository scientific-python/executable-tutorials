# Interactive Tutorial Demo

A repository demonstrating one way to manage and distribute interactive tutorials.
See the [Guide to Contributing](https://danielballan.github.io/interactive-tutorial-demo/contributing.html)
for a good overview of what this is like to use.

## Demo Links

- **[Tutorials (a.k.a. recipes)](https://github.com/danielballan/interactive-tutorial-demo/tree/notebooks/docs/recipes)** are written in MyST Markdown.
- They are published in **[Jupyter notebook](https://github.com/danielballan/interactive-tutorial-demo/tree/notebooks/docs/recipes)** format, on the `notebooks` branch of this repo, which can be used in Colab, Binder, etc.
- Executed examples are **[published](https://danielballan.github.io/interactive-tutorial-demo/)** on a GitHub Pages site.
- **[Jupyter Lite (beta)](https://danielballan.github.io/interactive-tutorial-demo/jupyterlite/lab/index.html)** (works only on the basic executable example so far, missing dependencies for others)
- **[Binder](https://mybinder.org/v2/gh/danielballan/interactive-tutorial-demo/notebooks)**


## Goals

- Make content easy to explore and try in a variety of modes:
  - interactive and non-interactive
  - local and cloud-based
  - Jupyter and not-Jupyter
- Document an accessible development workflow, so that non-experts can contribute.
- Keep the infrastructure as simple as possible.

## To Do

- Test notebook execution _of changed recipes only_ in CI on PR.
- Set up devcontainer.
- Add example with additional dependencies.

## Prior Art

Examples that this is drawing from:

- https://github.com/bsipocz/irsa-tutorials
- https://github.com/MotherDuck-Open-Source/sql-tutorial
