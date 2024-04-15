#!/bin/bash

dest="${HOME}/Projects"
mapfile -t repos <lists/repos.txt

mkdir ${dest}
cd ${dest}

for repo in "${repos[@]}"; do
    git clone "$repo"
done
