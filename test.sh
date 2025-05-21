#!/bin/bash

# Collect converted ipynb files to clean up at the end.
notebook_files=()

# Find Markdown files convert.
all_markdown_files=$(find tutorials -type f -name "*.md")

if [ $# -gt 0 ]; then
    echo "INFO: Testing only a subset of notebooks"
    if [[ "$1" == --changed ]]; then
        # We only want to run tests for the notebooks we touched compared to `branch`
        # provided in the second argument.
        branch=$2
        files_to_process=$(git fetch ${branch} --depth=1; git diff ${branch} --name-only tutorials | grep .md)

    else
        files_to_process="$@"
    fi

else
    echo "INFO: Testing all the notebooks"
    files_to_process=$all_markdown_files

fi

# Identify Markdown files that are Jupytext and convert them all.
for file in ${files_to_process}; do
    # Extract the kernel information from the Jupytext Markdown file.
    kernel_info=$(grep -A 10 '^---$' "$file" | grep -E 'kernelspec')
    # Skip if no kernel information was found.
    if [ -z "$kernel_info" ]; then
        continue
    fi
    # Convert to ipynb format, to be consumed by pytest nbval plugin.
    jupytext --to ipynb "$file"
    notebook_file="${file%.md}.ipynb"
    # Stash file in array to be cleaned up at the end.
    notebook_files+=("${notebook_file}")
done

pytest --nbval-lax -vv --suppress-no-test-exit-code --durations=10

_exitval="$?"

if [[ $_exitval > 0 ]]; then
    exit $_exitval
fi

# Clean up ipynb files that were converted.  Any stray ipynb files that were
# _not_ the result of conversion from Markdown will be left alone.
for file in "${notebook_files[@]}"; do
    rm -v "$file"
done
