#!/bin/bash

# If no arguments were provided, exit with error and show usage.
if [ $# -eq 0 ]; then
    echo "Usage: $0 md | ipynb " >&2
    exit 1
fi

# Variable to track if any errors occur
error_occurred=0

if [ "$1" = "ipynb" ]; then
    files=$(find docs/recipes/ -name "*.md" | grep -v .ipynb_checkpoints)
    for file in $files; do
        # Extract the kernel information from the Jupytext Markdown file
        kernel_info=$(grep -A 10 '^---$' "$file" | grep -E 'kernelspec')
        # Skip if no kernel information was found
        if [ -z "$kernel_info" ]; then
            continue
        fi
        jupytext --to ipynb "$file" && rm "$file"
        if [ $? -ne 0 ]; then
            error_occurred=1
            echo "Errors when converting $file"
        else
            echo "Converted $file"
        fi
    done
elif [ "$1" = "md" ]; then
    files=$(find docs/recipes/ -name "*.ipynb" | grep -v .ipynb_checkpoints)
    for file in $files; do
        jupytext --to markdown "$file" && rm "$file"
        if [ $? -ne 0 ]; then
            error_occurred=1
            echo "Errors when converting $file"
        else
            echo "Converted $file"
        fi
    done
fi

if [ $error_occurred -ne 0 ]; then
    echo "Some files failed to convert." >&2
    exit 1
else
    echo "All files converted successfully." >&2
    exit 0
fi

