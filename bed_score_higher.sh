#!/bin/bash

#Description: From a BED file, keep all regions whose score (column 5) is strictly higher than a threshold S provided by the user, then write the unique chromosomes (column 1) of those regions to a second output file.

#Usage: bed_score_higher.sh <filename.bed> <score_threshold>

infile="$1"
S="$2"

# Step 1 — Select all lines where score is > S
outfile="scoreht${S}_$infile"
awk -v S="$S" '($5 > S)' "$infile" > "$outfile"

# Step 2 — Extract a list of the unique chromosomes
cut -f1 "$outfile" | sort -u > "chromosomes_${outfile}"
