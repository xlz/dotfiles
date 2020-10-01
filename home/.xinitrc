exec </dev/null >/dev/null 2>>~/.xsession-errors
echo "--- $0: X session started for $LOGNAME at $(date)" >&2

urxvtd --quiet --opendisplay --fork

# neutralize freedesktop nepotism
export PULSE_CLIENTCONFIG=/
export PULSE_RUNTIME_PATH=/dev/null/kill-pulseaudio
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/dev/null
export DBUS_SESSION_BUS_ADDRESS=unix:path=/dev/null
export NO_AT_BRIDGE=1

read uptime </proc/uptime
echo Boot time=$uptime >&2

xrandr --output DisplayPort-0 --brightness 0.7
xrandr --output DisplayPort-0 --set TearFree on

exec x-window-manager
