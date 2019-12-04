# SteelSeries Arctis PulseAudio Profile Generator

A few SteelSeries Arctis gaming headsets (like the Arctis 5 and Arctis 7) have two stereo outputs, one for voice and one for all other sound, which can be mixed by using a knob called ChatMix.

Linux/PulseAudio by default only enables the voice chat output, since it's the first one. This profile generator will enable both, so you can use it as you would on Windows.

This generator was based off [DemonTPx/steelseries-arctis-5-pulseaudio-profile](https://github.com/DemonTPx/steelseries-arctis-5-pulseaudio-profile)'s profile, except it works in a completely automated manner. It also works with custom variants (like the Arctis 5 PUBG Edition), which have different product IDs, as far as it has "SteelSeries Arctis" on the device name.

## Installing

Clone this repo via command-line, cd into it and run `sudo ./configure.sh`.

Make sure the headset is plugged-in.

You should have both outputs available after this. If you don't, try rebooting your computer.