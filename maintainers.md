# Guide for Maintainers

This guide for configuring and maintaining collection of executable
tutorials.

## Notes on the notebook file format

We do use MyST Markdown format for the notebooks, please visit
[the upstream documentation](https://mystmd.org/guide/md-vs-ipynb)
to learn more about the reasoning behind the choice.  To provide a seamless
user experience for users in JupyterLab, we employ some libraries [^1] and a
little special configuration [^2].

## Specialized Patterns

Sometimes it is convenient to disable a job in a GitHub Action on certain Pull
Requests.  This may be added to the job to configure it to skip Pull Requests
that have a given label called `LABEL`.

```yaml
jobs:
  tests:
    if: ${{ !(github.event_name == 'pull_request') || !contains(github.event.pull_request.labels.*.name, 'LABEL') }}
```

[^1]: [jupytext][] and the [jupyterlab-myst JupyterLab extension][]
[^2]: See `.binder/postBuild` and `.binder/overrides.json`.
[jupytext]: https://pypi.org/project/jupytext/
[jupyterlab-myst JupyterLab extension]: https://pypi.org/project/jupyterlab-myst/
