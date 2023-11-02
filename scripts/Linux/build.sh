#! /usr/bin/bash

cd ../..

# if [ ! -d cmakefiles ]; then
    # mkdir cmakefiles;
# fi

cmake -S . -B "cmakefile" -G"Unix Makefiles" -DCMAKE_BUILD_TYPE='Release'

cmake --build . -j$(nproc)

error_code=$?

if [ ${error_code} -ne 0 ]; then
    echo "build failed.\n";
else
    echo "build was succesfull.\n";
fi