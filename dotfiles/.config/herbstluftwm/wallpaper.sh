speed=0.1

monitor=${1:-0}
geometry=($(herbstclient monitor_rect "$monitor"))

if [ -z "$geometry" ]; then
    echo "Invalid monitor $monitor"
    exit 1
fi

echo $monitor

xwinwrap -ni -ov -g ${geometry[2]}x${geometry[3]}+${geometry[0]}+${geometry[1]} -- \
  /usr/lib/xscreensaver/polytopes \
  -600-cell \
  -perspective-4d \
  -speed-wx ${speed} \
  -speed-wy ${speed} \
  -speed-wz ${speed} \
  -speed-xy ${speed} \
  -speed-xz ${speed} \
  -speed-yz ${speed} \
  -root \
  -window-id WID

