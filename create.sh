#!/bin/sh
set -xe
make clean
make linkcheck
make html
make dirhtml
make singlehtml
make htmlhelp
make devhelp
make epub
make man
make text
make gettext

mkdir build/release
cd build
zip -r release/html html
zip -r release/gettext gettext
zip -r release/htmlhelp htmlhelp
zip -r release/text text
zip -r release/singlehtml singlehtml
zip -r release/dirhtml dirhtml
cp man/thebookofv.1 release/
cp devhelp/TheBookofV.devhelp.gz release/
cp epub/TheBookofV.epub release/
cd ..
