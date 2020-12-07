# Rpi400Jam
Tools to easily create a Jamulus installation on the Raspberry Pi 400

## Step 0: When you just want to download a pre-configured image

A. If all you want to do is download a Raspbery Pi image with Jamulus pre-installed, well, have we got a deal for you! Just click on the following download link: [rpi400_jamulus_img.gz](https://1drv.ms/u/s!AhEZTg91Hm5djLobg5Sz8dHm40XtNg?e=Ge6tUO "rpi400_jamulus_img.gz")

This is a roughly 1.5 GB image file. For documentation on how to use that image, copy the "Step by Step" PDF file from the main Rpi400Jam code directory.

B. If you'd like to build the Raspberry Pi image yourself, perform the steps starting with Step 1 below.

## Step 1: Download the tools to your Raspberry Pi:

$ git clone https://github.com/bflamig/Rpi400Jam.git

## Step 2: Move to Rpi400Jam directory and confirm file permissions:
```
$ cd Rpi400Jam
$ chmod 755 j*.sh
$ ls -al
```
 
## Step 3: Copy the script files to your bin directory:

$ sudo cp j*.sh /usr/local/bin
  
## Step 4: You can now get rid of the Rpi400Jam directory:

```
$ cd
$ rm -r -f Rpi400Jam
```
  
## Step 5: Installing Jamulus and its prerequisites for the first time.

Run the following script from your home directory, and BE SURE TO INCLUDE THE Jamulus version number you'd like to install. At the time of this writing, that is r3_6_1. So that's what we show below. DON'T FORGET TO INCLUDE THIS ARGUMENT. This script will take a while to run, as it is installing a bunch of prerequisites, downloading Jamulus from github, and then compiling the source code. The compilation step takes a while -- possibly ten minutes or more:

```
$ cd
$ jamulus_install.sh r3_6_1
```
  
## Step 6: REBOOT YOUR MACHINE. THIS IS IMPORTANT!

$ sudo reboot now
  
## Step 7: Setup sound card for Jack audio service, Part 1

After rebooting (or during shutdown), hook up your sound card and then determine its name by using the following command, which lists the sound cards on your machine.

$ cat/proc/asound/cards

In the list produced the your sound card will likely be last. Its name is in the square brackets on the left. Note that name. For FocusRite Scarlett devices, the name is usually just "USB". For a Behringer UMC404HD its "U192k". Notice the upper case 'U' and lower case 'k'
  
## Step 7: Setup sound card for Jack audio service, Part 2

Given the name determined in Step 7, Part 1, create settings for Jack audio that Jamulus will use, by running the following script. Put the device name as the first argument. This script will create a hidden file called /home/pi/.jackdrc that Jack uses to determine its settings when Jamulus asks for them:

$ jack_setup.sh <device_name_here>
  
## Step 8: Confirm that Jamulus runs correctly, Part 1.

For now, open a terminal and type in the following: Note that to run Jamulus, use a uppercase 'J', unlike all the other places so far! (Yes, it's confusing.):

$ Jamulus
 
## Step 8: Confirm that Jamulus runs correctly, Part 2.

From the terminal window, you'll see a bunch of messages. You might see one (and only one) "socket error", but YOU SHOULD NOT SEE ANY error messages about not being able to allocate memory, or run with realtime privileges. If you see such error messages, something is wrong with the .jackdrc file.

The Jamulus dialog box will also popup at this time. Confirm that you can connect and play. If the jack setup wasn't done correctly, Jamulus may still run, but run very poorly with lots of latency (if at all).

## Step 9. Running Jamulus from GUI.

Once you've confirmed the Jamulus installation is good, you can more easily run Jamulus by clicking on the Jamulus icon in "Sound and Video" of the main menu entry of the GUI.
