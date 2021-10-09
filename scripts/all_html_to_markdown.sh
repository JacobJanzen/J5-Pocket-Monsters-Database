#!/bin/bash
for file in ../html_sources/*; do
    base=$(basename "$file")
    python capture_markdown.py ${file} > ../markdown_source/${base}.md
done
