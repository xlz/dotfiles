USRRES=~/.Xresources

exec </dev/null >/dev/null 2>>~/.xsession-errors
echo "--- $0: X session started for $LOGNAME at $(date)" >&2

[ -f "$USRRES" ] && xrdb -merge $USRRES

urxvtd --quiet --opendisplay --fork

pkill xsunpinyin
xsunpinyin -d

export XMODIFIERS="@im=xsunpinyin"
export GTK_IM_MODULE=xim
export PULSE_CLIENTCONFIG=/
export PULSE_RUNTIME_PATH=/dev/null/kill-pulseaudio

read product </sys/class/dmi/id/product_version
[ "$product" = 'ThinkPad X240' ] && xcalib ~/.config/awesome/Lenovo_Thinkpad_Yoga.icc

read uptime </proc/uptime
echo Boot time=$uptime >&2

exec x-window-manager
