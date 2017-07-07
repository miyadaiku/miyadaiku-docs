#!/bin/bash

miyadaiku-build .

REPO="git@github.com:miyadaiku/miyadaiku.github.io.git"

rm -rf miyadaiku.github.io
git clone ${REPO}
cp -r outputs/* miyadaiku.github.io/
cd miyadaiku.github.io
git add --all *
git commit -m "update doc" --author='autoupdate <circleci@example.com>'
git push ${REPO} master
rm -rf miyadaiku.github.io
