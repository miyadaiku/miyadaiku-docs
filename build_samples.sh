#!/bin/bash -e

pip install miyadaiku.themes.bootstrap4 miyadaiku.themes.fontawesome miyadaiku.themes.fullpagejs  
rm -rf doc/outputs/samples || true

miyadaiku-build --rebuild doc

mkdir doc/outputs/samples
for d in samples/*/ ; do
  miyadaiku-build --rebuild "$d"
  mkdir doc/outputs/$d
  cp -r $d/outputs/* doc/outputs/$d
done

