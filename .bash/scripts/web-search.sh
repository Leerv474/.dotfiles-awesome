#!/bin/sh

search_string=""

for arg in "$@"; do
    search_string="${search_string} ${arg}"
done

firefox -search "${search_string}"

