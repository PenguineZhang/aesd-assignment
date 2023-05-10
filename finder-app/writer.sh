#!/bin/bash

compiler=$1
make clean

if [ $# -lt 1 ]
then
    echo "Compiling with native compiler"
    make
else
    echo "Compiling with cross compiler"
    make -e CROSS_COMPILE=$compiler
fi
