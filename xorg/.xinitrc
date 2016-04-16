#!/bin/bash

numlockx &

exec start-pulseaudio-x11 &

exec feh --bg-fill ~/.wallpaper.jpg &
exec compton &

if [ -z "${DBUS_SESSION_BUS_ADDRESS-}" ] && type dbus-launch >/dev/null; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
fi

exec herbstluftwm
