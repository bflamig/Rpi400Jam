#!/bin/bash
echo "/usr/bin/jackd -T -P95 -p16 -t2000 -d alsa -dhw:$1 -p 64 -n 2 -r 48000" > /home/pi/.jackdrc
