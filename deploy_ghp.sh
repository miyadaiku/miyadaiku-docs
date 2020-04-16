#!/bin/bash -e

REPO="git@github.com:miyadaiku/miyadaiku.github.io.git"

git clone ${REPO}
cp -r doc/outputs/* miyadaiku.github.io/
cd miyadaiku.github.io
git add --all *
git commit -m "update doc" || true
git push ${REPO} master || true
cd ..
rm -rf miyadaiku.github.io
