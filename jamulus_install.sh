#!/bin/bash
cd /home/pi
sudo apt-get -y install jackd2
sudo apt-get -y install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
sudo apt-get patchage qjackctl
cd /home/pi
rm -r -f jamulus
git clone -b $1 https://github.com/corrados/jamulus.git
cd /home/pi/jamulus
qmake Jamulus.pro
make clean
sudo make install
sudo adduser -system --no-create-home jamulus
sudo adduser jamulus audio
cd /home/pi




