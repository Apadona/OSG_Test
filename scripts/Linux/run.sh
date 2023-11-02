#! /usr/bin/sh

cd ../../OpenSceneGraph-Data

export LD_LIBRARY_PATH='/usr/local/lib:/usr/local/lib64'

target_file_location='../build/release/sandbox'

if [ -f $target_file_location ]; then
    exec $target_file_location

else
    echo "Executable file does not exist.";
fi
