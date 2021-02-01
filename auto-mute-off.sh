#!/bin/sh

# card name
CARD=`sed -n 's/\s\([0-9]*\).*:\s.*Intel PCH/\1/p' /proc/asound/cards`

# check auto-mute state
amixer -c $CARD sget "Auto-Mute Mode" | grep "Item0: 'Disabled'"
# $? is 0 if auto-mute is disabled
# $? is 1 if auto-mute is enabled
if [ "$?" -eq "0" ]; then
    amixer -c $CARD sset "Auto-Mute Mode" Enabled
    notify-send 'auto-mute enabled' -u low -a ALSA -t 4000 -i audio-volume-muted
else
    amixer -c $CARD sset "Auto-Mute Mode" Disabled
    notify-send 'auto-mute disabled' -u low -a ALSA -t 4000 -i audio-volume-high
fi
