#! /usr/bin/bash

cd ../..

if [ -d "cmakefile" ]; then
    echo "CMakeFile exists, attempting to remove it."
    rm -rf cmakefile;
fi

if [-d "build"]; then
    echo "build file exists, attempting to remove it."
    rm -rf build;
fi