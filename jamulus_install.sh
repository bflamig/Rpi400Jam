#!/bin/bash
cd /home/pi
apt-get -y install jackd2
apt-get -y install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
cd /home/pi
rm -r -f jamulus
git clone -b r3_6_1 https://github.com/corrados/jamulus.git
cd /home/pi/jamulus
qmake Jamulus.pro
make clean
make install
adduser -system --no-create-home jamulus
adduser jamulus audio
cd /home/pi




