#!/bin/bash -l
#$ -S /bin/bash
#$ -N $2
echo $1
echo $2

cp "$2build/$1.pdf" "$2$1-built.pdf"
