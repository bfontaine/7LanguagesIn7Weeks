#! /bin/bash

cd /tmp
echo -n "Receiving archive... "
wget https://github.com/stevedekorte/io/zipball/master -O io.zip && echo "ok" || echo "fail! "
echo -n "Unzipping... "
unzip io.zip && rm -f io.zip && echo "ok" || echo "fail! "
cd stevedekorte-*
echo -n "Building... "
./build.sh && echo "ok" || echo "fail! "
sudo ./build.sh install
cd ..
#rm -Rf stevedekorte-*
