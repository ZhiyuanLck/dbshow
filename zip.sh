# !/bin/bash

rm -rf dbshow
mkdir dbshow
cp dbshow.sty dbshow/
cp dbshow-doc.tex dbshow/
cp dbshow-doc.pdf dbshow/
cp README.md dbshow/
zip -r dbshow.zip dbshow/
