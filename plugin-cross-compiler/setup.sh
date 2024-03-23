#!/bin/bash

cd tempfolder
git clone https://github.com/swiftly-solution/swiftly
cd swiftly

# Checkout the specific commit
git checkout cd713350d4987aa081650fe6d067ed790b24fd77

# Move the files
mv plugin_files/scripting/* ..; cd ..

cd /tempfolder/${1}
make
