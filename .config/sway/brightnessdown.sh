#! /usr/bin/bash

current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
lower_brightness=$(echo $current_brightness - 25|bc)
echo $lower_brightness > /sys/class/backlight/intel_backlight/brightness
