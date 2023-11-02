#!/usr/bin/bash

cd ../..

cmake -S . -B"cmakefiles" -G"Unix Makefiles" -DCMAKE_BUILD_TYPE='Debug' -DCMAKE_PREFIX_PATH='/usr/local/lib64'

cmake --build cmakefiles -j$(nproc)

error_code=$?

if [ ${error_code} -ne 0 ]; then
    echo "Debug build failed.\n";
else
    echo "Debug build was succesfull.\n";
fi