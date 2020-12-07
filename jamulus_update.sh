#!/bin/bash
cd ~/
rm -r -f jamulus
git clone -b $1 https://github.com/corrados/jamulus.git
cd ~/jamulus
qmake Jamulus.pro
make clean
sudo make install
cd ~/
