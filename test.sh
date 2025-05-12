#!/bin/bash

notebook_files=()

convert_file() {
    local file="$1"
    # Convert to ipynb format, to be consumed by pytest nbval plugin.
    jupytext --to ipynb $file
    if [ $? -ne 0 ]; then
        error_occurred=1
        echo "Errors when converting $file"
        # Exit early
        exit 1
    fi
    notebook_file="${file%.md}.ipynb"
    # Stash file in array to be cleaned up at the end.
    notebook_files+=("${notebook_file}")
    local status=$?
}


# If no arguments were provided, exit with error and show usage.
if [ $# -eq 0 ]; then
    echo "Usage: $0 [filepaths...] | --all" >&2
    exit 1
fi

# Variable to track if any errors occur
error_occurred=0

# If --all is passed, locate eligible files and execute them all.
if [ "$1" == "--all" ]; then
    files=$(find "tutorials" -name "*.md" | grep -v .ipynb_checkpoints)
    for file in $files; do
        if [ -f "$file" ]; then
	    # Extract the kernel information from the Jupytext Markdown file
	    kernel_info=$(grep -A 10 '^---$' "$file" | grep -E 'kernelspec')
            # Skip if no kernel information was found
            if [ -z "$kernel_info" ]; then
		continue
            fi
            convert_file "$file"
	    if [ $? -ne 0 ]; then
                error_occurred=1
            fi
        else
            echo "File not found: $file" >&2
        fi
    done
else
    # If filepaths are passed, execute them.
    for file in "$@"; do
        if [ -f "$file" ]; then
            convert_file "$file"
	    if [ $? -ne 0 ]; then
                error_occurred=1
            fi
        else
            echo "File not found: $file" >&2
	    # Exit early
	    exit 1
        fi
    done
fi

pytest --nbval

# Clean up ipynb files that were converted.  Any stray ipynb files that were
# _not_ the result of conversion from Markdown will be left alone.
for file in "${notebook_files[@]}"; do
    rm -v "$file"
done

if [ $error_occurred -ne 0 ]; then
    echo "Some files executed with unexpected errors." >&2
    exit 1
else
    echo "All files executed successfully." >&2
    exit 0
fi


