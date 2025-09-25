# Executable Tutorials

This is meant to demonstrate by example how to deploy tutorial materials. The
examples show common patterns including runnable code, plots, exercises with
solutions, etc.

## How to Run The Code

`````{tab-set}
````{tab-item} Locally with pixi

Clone the repository and launch JupyterLab.

```sh
git clone https://github.com/scientific-python/executable-tutorials
cd executable-tutorials

pixi run start
```
````

````{tab-item} Locally with pip

Clone the repository, create an enviornment, install the requirements, and
launch JupyterLab.


```sh
git clone https://github.com/scientific-python/executable-tutorials
cd executable-tutorials

python -m venv .venv
source .venv/bin/activate

pip install -r requirements.txt
jupyter lab
```
````

````{tab-item} In Cloud with Binder

[Open on Binder][].

````

````{tab-item} JupyterLite (experimental)

[Open with JupyterLite][].

````
`````

Or, instead of _running_ the code, you may view the code and results by
following the links below.

## Example Tutorials

We maintain a collection of example tutorials so showcase some features.

::::{grid} 1 1 2 2
:::{card} Executable Code ✨
:link: ./tutorials/executable/basics.md
Tutorial with basic executable cells.
:::

:::{card} Interactive Matplotlib Figures 🐍
:link: ./tutorials/matplotlib/interactive_mpl.md
Tutorial with interactive matplotlib figures.
:::

:::{card} Static Matplotlib Figures 📑
:link: ./tutorials/matplotlib/static_mpl.md
Tutorial with interactive matplotlib figures.
:::

:::{card} Static Code 📖
:link: ./tutorials/static/static.md
Tutorial with static content, code cells are not executed.
:::

::::


## Contributing documentation

We maintain guideline documents for maintainers of tutorial repositories in our [Maintainers' Guide](./maintainer-guide.md).
We envision this document to be a collection of collective wisdom about maintaining MyST Markdown based executable tutorials.

We also have a document for contributors of this repository in our [Contributors' Guide](./contributing.md).


[Open on Binder]: https://mybinder.org/v2/gh/scientific-python/executable-tutorials/main?urlpath=tree/tutorials/
[Open with JupyterLite]: https://scientific-python.github.io/executable-tutorials/jupyterlite/lab/index.html
