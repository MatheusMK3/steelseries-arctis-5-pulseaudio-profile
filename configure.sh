#!/bin/bash

# We need to be root since we're copying stuff to protected directories
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

# Check for the USB headset with lsusb
USB_RAW=`lsusb | grep 'SteelSeries Arctis'`

# Work out the device vendor and product ID
USB_DEV=`echo "$USB_RAW" | cut -d' ' -f 6`

# Split it to get proper IDs
USB_DEV_VENDOR=`echo "$USB_DEV" | cut -d':' -f 1`
USB_DEV_PRODUCT=`echo "$USB_DEV" | cut -d':' -f 2`

# Print for confirmation
echo "Device found: $USB_DEV_VENDOR:$USB_DEV_PRODUCT ($USB_RAW)"

# Create the profile
echo "Writing .rules file..."
echo "ATTRS{idVendor}==\"$USB_DEV_VENDOR\", ATTRS{idProduct}==\"$USB_DEV_PRODUCT\", ENV{PULSE_PROFILE_SET}=\"steelseries-arctis-usb-audio.conf\"" > 91-pulseaudio-steelseries-arctis.rules

# Write the profiles to folders
echo "Installing .rules and .conf files..."
cp 91-pulseaudio-steelseries-arctis.rules /etc/udev/rules.d/
cp steelseries-arctis-usb-audio.conf /usr/share/pulseaudio/alsa-mixer/profile-sets/
cp steelseries-arctis-output-chat.conf /usr/share/pulseaudio/alsa-mixer/paths/
cp steelseries-arctis-output-game.conf /usr/share/pulseaudio/alsa-mixer/paths/

# Restart PulseAudio
echo "Restarting PulseAudio..."
pulseaudio -k
pulseaudio --start

# Done
echo "Files installed successfully. If the new outputs don't show straight away, try restarting your system."
