#!/bin/bash

PANDOCCMD='pandoc --table-of-contents -V geometry:margin=2cm --from=markdown_github+tex_math_dollars+inline_code_attributes'

if [ $# -eq 0 ] || [ $# -gt 2 ]
then 
  echo "Usage: ./convert-md source-file [destination-file]"
elif [ $# -eq 1 ]
then
  filename=$(basename "$1")
  filename="${filename%.*}"
  eval "${PANDOCCMD} $1 -o ${filename}.pdf"
else
  eval "${PANDOCCMD} $1 -o $2"
fi
