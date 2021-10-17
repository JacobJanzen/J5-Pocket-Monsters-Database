#!/bin/bash
for file in ../html_sources/*; do
    base=$(basename "$file")
    python capture_markdown.py ${file} > "../markdown_sources/${base}.md"
done
