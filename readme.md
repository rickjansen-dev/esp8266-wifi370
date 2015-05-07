esp8266-wifi370
==================

Implementation of the wifi370 protocol to connect cheap RGB ledstrips to pimatic using a esp8266.
Currently this repository contains the following:

 - Lua scripts to run on NodeMCU firmware
 - Eagle PCB schematic & board layout

## Quick how-to setup

- Install [pimatic] and the excellent [pimatic-led-light] plugin
- Install NodeMCU on the esp8266, connect it to your wifi & upload the lua scripts (ESPlorer is a nice tool to do this)

For the pimatic-led-light configuration, use wifi370 as the device parameter.
It's probably a good idea to set up your router's DHCP server so your esp8266 will get the same IP address every time.

## Eagle PCB schematic & board layout

There's a PCB schematic & board layout in the repository. The PCB contains the ESP-03, a voltage regulator, a power input & 3 logic gate MOSFETs to control the RGB channels of the ledstrip. See my blog at [auspex.nl] for a more detailed explanation.

## Demo video

I recorded a demonstration video, you can watch it [here].  
I am aware of VVS, it was just easier to get everything on screen and use my mouse at the same time =]

## Known bugs

- The PWM output sometimes glitches due to being software-based PWM. It only really flickers when moving from one color to another. 
- The output color is stored in the esp8266's flash memory. The pimatic-led-light UI can output a lot of values in a short amount of time which leads to lots of writes to the flash memory. I am unsure if this will be a problem and if the esp8266's flash can become corrupt. Use at your own risk.
- The on-off state might not always be in the correct state, as the wifi370 protocol implementation is very basic.

[pimatic]:http://pimatic.org
[pimatic-led-light]:https://github.com/philip1986/pimatic-led-light
[auspex.nl]:http://auspex.nl
[here]:http://youtu.be/MzmGHIzuEzY

