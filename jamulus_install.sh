#!/bin/bash
cd ~/
sudo apt-get -y install jackd2
sudo apt-get -y install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
sudo apt-get -y install patchage qjackctl
cd ~/
rm -r -f jamulus
# uncomment the line below for jamulus versions before 3_7_0
#git clone -b $1 https://github.com/corrados/jamulus.git
# uncomment the line below for jamulus versions on or after 3_7_0
git clone -b $1 https://github.com/jamulussoftware/jamulus.git
cd ~/jamulus
qmake Jamulus.pro
make clean
sudo make install
sudo adduser -system --no-create-home jamulus
sudo adduser jamulus audio
cd ~/
echo "*** WARNING: You MUST reboot your machine for these changes to take effect ***"




