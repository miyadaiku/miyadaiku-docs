#!/bin/bash -e

REPO="git@github.com:miyadaiku/miyadaiku.github.io.git"
git config --global user.email "autp@example.com"
git config --global user.name "auto circleci"
  
rm -rf miyadaiku.github.io || true
git clone ${REPO}

rm -rf miyadaiku.github.io/* || true
miyadaiku-build doc
cp -r doc/outputs/* miyadaiku.github.io/

mkdir miyadaiku.github.io/samples

for d in samples/*/ ; do
  miyadaiku-build "$d"
  mkdir miyadaiku.github.io/$d
  cp -r $d/outputs/* miyadaiku.github.io/$d
done

cd miyadaiku.github.io
git add --all *
git commit -m "update doc"
git push ${REPO} master
rm -rf miyadaiku.github.io
