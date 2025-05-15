#!/bin/bash

# Find Markdown files convert.
all_markdown_files=$(find tutorials -type f)
if [ $# -gt 0 ]; then
    files_to_process="$@"
else
    files_to_process=$all_markdown_files
fi

OUTDIR="_build/ipynbs"

# Identify Markdown files that are Jupytext and convert them all.
for file in ${files_to_process}; do
    echo "Making directory: $OUTDIR/$(dirname $file)"
    mkdir -p $OUTDIR/$(dirname $file)

    echo loop in $file
    # Extract the kernel information from the Jupytext Markdown file.
    kernel_info=$(grep -A 10 '^---$' "$file" | grep -E 'kernelspec')
    # Skip if no kernel information was found.
    if [ -z "$kernel_info" ]; then
      cp $file $OUTDIR/$file
      continue
    fi
    # Convert to ipynb format, to be consumed by pytest nbval plugin.
    notebook_file="${file%.md}.ipynb"
    jupytext --to ipynb "$file" --output $OUTDIR/${notebook_file}
    # Stash file in array to be cleaned up at the end.
done
