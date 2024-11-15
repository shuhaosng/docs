#!/bin/bash

gcc -fPIC -shared -Wl,-soname,libpthread-setaffinity.so -ldl -o libpthread-setaffinity.so pthread-setaffinity.c
mkdir -p "/opt/fix/"
mv libpthread-setaffinity.so /opt/fix/libpthread-setaffinity.so
chmod a+x /opt/fix/libpthread-setaffinity.so
export LD_PRELOAD=/opt/fix/libpthread-setaffinity.so