#! /usr/bin/sh

cd ../..

if [ -f ./bin/TestOsg ]; then
    exec ./bin/TestOsg;

else
    echo "Executable file does not exist.";
fi
