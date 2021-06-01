#!/bin/bash

set -e

rm -rf release
mkdir -p release

mkdir -p release/doc/latex/sjtuthesis
cp source/sjtuthesis.pdf release/doc/latex/sjtuthesis

mkdir -p release/source/latex/sjtuthesis
cp source/sjtudoc.cls release/source/latex/sjtuthesis
cp source/sjtuthesis.dtx release/source/latex/sjtuthesis
cp source/sjtuthesis.ins release/source/latex/sjtuthesis

mkdir -p release/tex/latex/sjtuthesis
cp source/sjtuthesis.cls release/tex/latex/sjtuthesis
cp source/sjtuthesis-graduate.ltx release/tex/latex/sjtuthesis
cp source/sjtuthesis-undergraduate.ltx release/tex/latex/sjtuthesis
cp -a vi release/tex/latex/sjtuthesis
mkdir -p release/tex/latex/sjtuthesis/fd
cp source/*-font-*.def release/tex/latex/sjtuthesis/fd

cd release

tree .
zip -r sjtuthesis.tds.zip .
