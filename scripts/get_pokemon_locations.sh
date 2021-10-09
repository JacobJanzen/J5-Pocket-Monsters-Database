#!/bin/bash
for file in ../markdown_source/*; do
    base=$(basename "${file}")
    echo ${base}
    python extract_section.py Pokémon ${file} >> ../data/pokemon_locations
done
