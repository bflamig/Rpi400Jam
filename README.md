# Rpi400Jam

We've found using the new Raspberry Pi 400 with your favorite USB audio device and monitor makes for a great, compact setup for running Jamulus. With that in mind, we've provided tools to easily create a Jamulus installation on a Raspberry Pi 400. 

While these tools were developed with the Raspberry Pi 400 in mind, they will probably also work on any of the Raspberry Pi models, 3B+ and up, though that hasn't been tested thoroughly yet.

There are two ways you can go about setting up your Pi to run Jamulus. One is to just the pre-configured image file (meant for the Raspberry Pi 400), the other is to install Jamulus yourself, using the scripts we provide here.

## Step 0: When you just want to download a pre-configured image

A. If all you want to do is download a Raspbery Pi SD card image with Jamulus pre-installed, well, have we got a deal for you! Just click on the following link to download the roughly 1.5 GB file (!): [rpi400_jamulus_img.gz](https://1drv.ms/u/s!AhEZTg91Hm5djLolQteTlFIwnUPyWw?e=rvrKlW "rpi400_jamulus_img.gz")

For documentation on how to use this SD card image, open the "Step by Step" PDF file from the main Rpi400Jam code directory.

B. If you'd like to build the Raspberry Pi image yourself, perform the steps below.

## Step 1: Download the tools to your Raspberry Pi:

First, ensure you are in your home directory:
```
$ cd
```
Then download the scripts from github:
```
$ git clone https://github.com/bflamig/Rpi400Jam.git
```

## Step 2: Move to Rpi400Jam directory and confirm file permissions on the scripts:
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

Run the jamulus_install.sh script from your home directory, and BE SURE TO INCLUDE THE Jamulus version number you'd like to install. At the time of this writing, the latest release is r3_6_1 so that's what we show below. DON'T FORGET TO INCLUDE THIS ARGUMENT. This script will take a while to run, as it is installing a bunch of prerequisites, downloading Jamulus from github, and then compiling the source code. The compilation step takes a while -- possibly ten minutes or more:

```
$ cd
$ jamulus_install.sh r3_6_1
```

NOTE: We also install the qjackctl utility, as well as a utility called patchage. These are not required to run Jamulus. We just find them useful for time to time in checking out connections, etc.
  
## Step 6: REBOOT YOUR MACHINE. THIS IS IMPORTANT!

$ sudo reboot now
  
## Step 7: Setup sound card for Jack audio service, Part 1

After rebooting (or while shutdown), hook up your sound card if it's not already hooked up, and then determine its name by using the following command, which lists the sound cards on your machine.

$ cat/proc/asound/cards

In the list produced your sound card will likely be last. Its name is in the square brackets on the left. Note that name. For FocusRite Scarlett devices, the name is usually just "USB". For a Behringer UMC404HD it's "U192k". Notice the upper case 'U' and lower case 'k'.
  
## Step 7: Setup sound card for Jack audio service, Part 2

Given the name determined in Step 7, Part 1, create the settings for Jack audio that Jamulus can use by running the following script. Put the device name in as the first argument. This script will create a hidden file called ~/.jackdrc in the home directory that Jack uses to determine its settings when Jamulus asks to be a client:

$ jack_setup.sh <device_name_here>

Inspect the file to see settings:

$ cat ~/.jackdrc

We've defaulted the settings to a period buffer size of 64, number of periods to 2, and a Jamulus-required sample rate of 48000. This should work fine on a Raspberry Pi 400, though your mileage may vary. We've also configured Jack to run at a high priority of 95, and the -T option means that Jack will stop running after Jamulus finishes (assuming its the last client). If you need to change any of these settings, you can manually edit the .jackdrc file. Alternatively, if you have qjackctl installed, you can just use that to configure the Jack settings. Note there is an option in qjackctl to save to the .jackdrc file.

While it's possible to use qjackctl to start Jack, you have to remember to do that before starting Jamulus. Because of this, I don't usually use qjackctl, but rather let Jamulus rely directly on the .jackdrc file. However, running qjackctl ahead of time is useful for the initial setup, as you can easily see how many xruns you are getting, etc. But once you've got settings you are happy with, there's no reason to use qjackctl every time you run Jamulus.
  
## Step 8: Confirm that Jamulus runs correctly, Part 1.

For now, open a terminal and type in the following: Note that to run Jamulus, use a uppercase 'J', unlike all the other places so far! (Yes, it's confusing.):

$ Jamulus
 
## Step 8: Confirm that Jamulus runs correctly, Part 2.

From the terminal window, you'll see a bunch of messages. You might see one (and only one) "socket error", but YOU SHOULD NOT SEE ANY more of those socket error messages, nor any messages about not being able to allocate memory, or run with realtime privileges. If you see any such error messages, something is wrong with the .jackdrc file.

NOTE: The single "socket error" message appears to be harmless. We don't know why it occurs, but we do note it only occurs the first time you run Jamulus. After that, the message never seems to appear.

The Jamulus dialog box will also popup at this time. Confirm that you can connect and play. If the jack setup wasn't done correctly, Jamulus may still work, but may run very poorly with lots of latency (if it runs at all).

NOTE: For lowest latency, it's usually best to try checking the "Use small network buffers" in the settings dialog.

## Step 9. Running Jamulus from GUI.

Once you've confirmed the Jamulus installation is good, you can more easily run Jamulus by clicking on the Jamulus icon in "Sound and Video" entry of the main menu on the desktop. Note that you don't need to start qjackctl at first. In fact, you don't need it at all.
