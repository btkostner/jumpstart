#!/bin/bash

numlockx &

exec start-pulseaudio-x11 &

exec feh --no-fehbg --bg-fill ~/.wallpaper.jpg &
exec compton --config ~/.config/compton.conf  &

if [ -z "${DBUS_SESSION_BUS_ADDRESS-}" ] && type dbus-launch >/dev/null; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
fi

exec herbstluftwm
