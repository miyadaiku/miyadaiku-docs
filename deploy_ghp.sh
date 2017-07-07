#!/bin/bash

miyadaiku-build .

REPO="git@github.com:miyadaiku/miyadaiku.github.io.git"
git config --global user.email "autp@example.com"
git config --global user.name "auto circleci"
  
rm -rf miyadaiku.github.io
git clone ${REPO}
cp -r outputs/* miyadaiku.github.io/
cd miyadaiku.github.io
git add --all *
git commit -m "update doc"
git push ${REPO} master
rm -rf miyadaiku.github.io
