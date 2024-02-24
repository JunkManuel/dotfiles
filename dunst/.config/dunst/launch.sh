#!/bin/sh

### Thai not worki anymore
#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
# 
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
# 
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

# pidof dunst && killall dunst

dunst -print
