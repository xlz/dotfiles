USRRES=~/.Xresources

exec </dev/null >/dev/null 2>>~/.xsession-errors
echo "--- $0: X session started for $LOGNAME at $(date)" >&2

[ -f "$USRRES" ] && xrdb -merge $USRRES

urxvtd --quiet --opendisplay --fork

# neutralize freedesktop nepotism
export PULSE_CLIENTCONFIG=/
export PULSE_RUNTIME_PATH=/dev/null/kill-pulseaudio
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/dev/null
export DBUS_SESSION_BUS_ADDRESS=unix:path=/dev/null
export NO_AT_BRIDGE=1

read product </sys/class/dmi/id/product_version
[ "$product" = 'ThinkPad X240' ] && xcalib ~/.config/awesome/Lenovo_Thinkpad_Yoga.icc

read uptime </proc/uptime
echo Boot time=$uptime date=`date +%s` >&2

xrandr --output DP1 --brightness 0.8

exec x-window-manager
