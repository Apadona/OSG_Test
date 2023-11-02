#! /usr/bin/sh

cd ../..

export LD_LIBRARY_PATH='/usr/local/lib:/usr/local/lib64'

target_file_location='./build/debug/sandbox'

if [ -f $target_file_location ]; then
    exec $target_file_location

else
    echo "Executable file does not exist.";
fi
