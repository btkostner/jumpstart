#!/bin/bash
set -e

panelcmd=~./panel.sh

herbstclient emit_hook quit_panel
killall dzen2

for i in $(herbstclient list_monitors | cut -d':' -f1) ; do
    "$panelcmd" $i &
done
