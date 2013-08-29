#!/bin/bash

mask='*.properties'
concat_file="properties.all"
trgt_concat_file="all.properties"

if [ $# -eq 1 ]; then
	mask="$1*.properties"
	concat_file="$1.properties.all"
	trgt_concat_file="$1.all.properties"
fi

echo "Using $mask and $trgt_concat_file"

rm $concat_file 2>/dev/null

find . -type f -name "$mask" -exec cat {} >> $concat_file \;
mv "$concat_file" "$trgt_concat_file"
	