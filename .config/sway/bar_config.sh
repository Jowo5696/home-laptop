#!/usr/bin/bash
#bold=$('\033[1m')

uptime_formatted=$(uptime | cut -d , -f 1 | cut -d ' ' -f3,4,5)

date_formatted=$(date '+%a %F %H')
date_formattedm=$(date '+%M')

linux_formatted=$(uname -r | cut -d '-' -f1)

battery_charge=$(cat /sys/class/power_supply/BAT1/capacity)
battery=$(
if [[ $battery_charge == 69 ]];
then 
        echo 'nice'
else
        echo $battery_charge
fi
)
B=$(cat /sys/class/power_supply/BAT1/status)
battery_status=$(
if [[ $B == 'Charging' ]]; 
then
	echo 'C'
fi
)
when_charge=$( if [[ $battery_charge > 84 && $B == 'Charging' ]];
then 
        echo stop
elif [[ $battery_charge -le 25 && $B != 'Charging' ]];
then
        echo charge
fi
)

uptime_sec=$(uptime | cut -d , -f1 | cut -d ' ' -f3,4,5 | cut -d ' ' -f3)
ping=$(ping -c 1 www.archlinux.org | cut -d ' ' -f8 | cut -d 'l' -f1 | cut -d '=' -f2)
connection=$(nmcli d wifi show | cut -d ' ' -f2 | head -1)

tx=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
tx_sc=$(echo $tx / $uptime_sec |bc)
tx_sec=$(echo "$tx / 2" |bc) 

brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
brightness_p=$(
if [[ $brightness == 400 ]];
then
        echo '100'
else
        echo $brightness / 400*100|bc -l|cut -c1-4
fi
)

volume=$(amixer get Master |grep Mono: |cut -d ' ' -f7 | cut -d '[' -f2 |cut -d ']' -f1)
volume_p=$(amixer get Master |grep Mono: |cut -d ' ' -f6 |cut -d'[' -f2 |cut -d']' -f1)
volume_mute=$(amixer get Master |grep Mono: |cut -d ' ' -f8 |cut -d'[' -f2 |cut -d']' -f1)
volume_state=$(
if [[ $volume_mute == 'on' ]]
then
        echo 'on('$volume','$volume_p')'
else
        echo 'off'
fi
)

echo '>' 'einfach machen' '|' 'it is GNU/Linux' '|' 'i use arch btw' '|' 'LNX' $linux_formatted '|' 'CON' $connection '|' 'BAT' $battery'%' $battery_status $when_charge '|' 'VOL' $volume_state '|' 'BRT' $brightness'('$brightness_p'%'')' '|' $date_formatted':'$date_formattedm '<'
