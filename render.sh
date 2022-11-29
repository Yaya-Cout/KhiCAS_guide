#!/usr/bin/env bash
# Render a Markdown file to PDF using Pandoc
# Usage: render.sh [input.md] [output.pdf]

DEFAULT_INPUT="KhiCAS_guide.md"
DEFAULT_OUTPUT="KhiCAS_guide.pdf"

# Check for Pandoc
if ! command -v pandoc &> /dev/null
then
    echo "Pandoc could not be found"
    exit
fi

# Check for input file
if [[ -z "$1" ]]
then
    echo "No input file specified, using default"
    INPUT="${DEFAULT_INPUT}"
else
    INPUT="$1"
fi

# Check for output file
if [[ -z "$2" ]]
then
    echo "No output file specified, using default"
    OUTPUT="${DEFAULT_OUTPUT}"
else
    OUTPUT="$2"
fi

# Render (-H disable_float.tex fix image placement)
pandoc -H disable_float.tex --table-of-contents "${INPUT}" -o "${OUTPUT}"

echo "Rendered ${INPUT} to ${OUTPUT}"
