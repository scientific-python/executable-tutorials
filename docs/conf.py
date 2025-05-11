extensions = ["myst_nb", "sphinx_copybutton"]

html_theme = 'sphinx_book_theme'
html_title = 'Interactive Tutorial Demo'
html_theme_options = {
    "repository_url": "https://github.com/danielballan/interactive-tutorial-demo",
    "path_to_docs": "docs",
    "repository_branch": "main",
    "use_repository_button": True,
    "use_issues_button": True,
    "use_edit_page_button": True,
}
nb_execution_mode = "auto"
