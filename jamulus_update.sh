#!/bin/bash
cd /home/pi
rm -r -f jamulus
git clone -b $1 https://github.com/corrados/jamulus.git
cd /home/pi/jamulus
qmake Jamulus.pro
make clean
make install
cd /home/pi
