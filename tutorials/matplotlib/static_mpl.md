---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.4
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Static Matplotlib Figures

Specify the static Jupyter matplotlib integration. This must be run first, before any figures are created.

This disables any interactivity, displaying only a PNG image of the figure in the Jupyter Lab view.

```{code-cell} ipython3
%matplotlib inline
```

```{code-cell} ipython3
import matplotlib.pyplot as plt

plt.plot([1,2,3,4])
```


```{code-cell} ipython3
import matplotlib.pyplot as plt

plt.plot([1,4,9,16])
```
