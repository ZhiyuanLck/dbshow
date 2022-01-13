# !/bin/bash

rm -rf dbshow
rm -rf dbshow.zip
mkdir dbshow
cp dbshow.dtx dbshow/
cp dbshow.pdf dbshow/
cp README.md dbshow/
zip -r dbshow.zip dbshow/
