#!/bin/bash -e

OUTDIR=miyadaiku.github.io

pip3 install -r requirements.txt
miyadaiku-build --rebuild -o $OUTDIR .

mkdir ${OUTDIR}/samples || true
for d in samples/*/ ; do
  echo "$d"
  pip3 install -r $d/requirements.txt
  miyadaiku-build --rebuild -o "$OUTDIR/$d" "$d"
done

