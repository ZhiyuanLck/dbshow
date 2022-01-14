# !/bin/bash

rm -rf dbshow
rm -rf dbshow.zip
mkdir dbshow
tex dbshow.dtx
cp README.md dbshow/
cp dbshow.ins dbshow/
cp dbshow.dtx dbshow/
cp dbshow.pdf dbshow/
zip -r dbshow.zip dbshow/
