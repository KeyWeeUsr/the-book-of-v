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
