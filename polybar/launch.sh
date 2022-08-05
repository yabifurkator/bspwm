#!/bin/bash

# poweroff all polybars
killall -q polybar

# wait while all polybars are going poweroff
while pgrep -x polybar;
do
    sleep 1;
done

Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
file=~/.config/bspwm/polybar/param.ini

echo "[param]" > $file
if (($Xaxis == 1920)); then
	echo "border-size = 875" >> $file
fi
if (($Xaxis == 1366)); then
	echo "border-size = 595" >> $file
fi

# launch polybars
# polybar -c ~/.config/bspwm/polybar/config.ini colorfil &
# sleep 1
polybar -c ~/.config/bspwm/polybar/config.ini panel

