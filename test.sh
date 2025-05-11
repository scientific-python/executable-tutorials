#!/bin/bash

# Execute file as Jupyter notebook.
# Do not write anything to disk.
# If there are any uncaught exceptions, show them in stderr.
execute_file() {
    local file="$1"
    echo "Executing $file" >&2
    # Redirect stdout (the executed notebook document JSON)
    # to /dev/null. In the event of an uncaught exception,
    # the traceback will go to stderr and thus be shown
    # to the caller.
    jupytext --to notebook --execute $file -o - > /dev/null
    local status=$?
    if [ $status -ne 0 ]; then
        echo "Error processing file: $file" >&2
        return $status
    fi
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
    files=$(find docs/recipes/ -name "*.md" | grep -v .ipynb_checkpoints)
    for file in $files; do
        if [ -f "$file" ]; then
	    # Extract the kernel information from the Jupytext Markdown file
	    kernel_info=$(grep -A 10 '^---$' "$file" | grep -E 'kernelspec')
            # Skip if no kernel information was found
            if [ -z "$kernel_info" ]; then
		continue
            fi
            execute_file "$file"
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
            execute_file "$file"
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

if [ $error_occurred -ne 0 ]; then
    echo "Some files executed with unexpected errors." >&2
    exit 1
else
    echo "All files executed successfully." >&2
    exit 0
fi
