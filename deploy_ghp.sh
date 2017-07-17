#!/bin/bash -e

REPO="git@github.com:miyadaiku/miyadaiku.github.io.git"
git config --global user.email "autp@example.com"
git config --global user.name "auto circleci"
  
rm -rf miyadaiku.github.io || true

miyadaiku-build doc
mkdir doc/outputs/samples

for d in samples/*/ ; do
  miyadaiku-build "$d"
  mkdir doc/outputs/$d
  cp -r $d/outputs/* doc/outputs/$d
done

git clone ${REPO}
cp -r doc/outputs/* miyadaiku.github.io/
cd miyadaiku.github.io
git add --all *
git commit -m "update doc" || true
git push ${REPO} master || true
cd ..
rm -rf miyadaiku.github.io
