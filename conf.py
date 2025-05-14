# -- Project information -----------------------------------------------------

project = 'Scientific Python Executable Tutorials'
copyright = '2025, Scientific Python developers'
author = 'Scientific Python developers'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.

extensions = [
    "myst_nb",
    "sphinx_copybutton",
    "sphinx_design",
]

myst_enable_extensions = [
    'dollarmath',
]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [
    '_build',
    'notes',
    '.pixi',
    '.tox',
    '.tmp',
    '.pytest_cache',
    'README.md'
]

# MyST-NB configuration
nb_merge_streams = True
nb_execution_mode = "cache"

nb_execution_excludepatterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_book_theme'
html_title = 'Executable Tutorials'
html_theme_options = {
    "repository_url": "https://github.com/scientific-python/executable-tutorials",
    "repository_branch": "main",
    "use_repository_button": True,
    "use_issues_button": True,
    "use_edit_page_button": True,
    "launch_buttons": {
        "binderhub_url": "https://mybinder.org"
    },
}
