#!/bin/bash

INPUT="$1"
OUTPUT="$2"

if [[ -z "$INPUT" ]]; then
  echo "❌ INPUT not provided"
  exit 1
fi

# Derive default output path if not provided
if [[ -z "$OUTPUT" ]]; then
  BASENAME="$(basename "$INPUT" .ipynb)"
  DIRNAME="$(dirname "$INPUT")"
  OUTPUT="$DIRNAME/$BASENAME.html"
fi

echo "📘 Converting: $INPUT"
echo "➡️ Output to: $OUTPUT"

mkdir -p "$(dirname "$OUTPUT")"

# Convert notebook to HTML
jupyter nbconvert --to html "$INPUT" \
  --output "$(basename "$OUTPUT" .html)" \
  --output-dir "$(dirname "$OUTPUT")"
