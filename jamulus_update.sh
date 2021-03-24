#!/bin/bash
cd ~/
rm -r -f jamulus
# Uncomment the line below for jamulus versions before 3_7_0
# git clone -b $1 https://github.com/corrados/jamulus.git
# Uncomment the line below for jamulus versions on or after 3_7_0
git clone -b $1 https://github.com/jamulussoftware/jamulus.git
cd ~/jamulus
qmake Jamulus.pro
make clean
sudo make install
cd ~/
