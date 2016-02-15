#!/bin/bash
set -e

wallpapercmd=./wallpaper.sh

herbstclient emit_hook quit_wallpaper
killall polytopes

for i in $(herbstclient list_monitors | cut -d':' -f1) ; do
  echo $i  
  "$wallpapercmd" $i &
done
