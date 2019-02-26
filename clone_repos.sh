#!/bin/bash
# Clone repos containing custom packs
IFS=","
for repo in $REPOS
do
   git clone $repo
done
