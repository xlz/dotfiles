USRRES=~/.Xresources

exec </dev/null >/dev/null 2>>~/.xsession-errors
echo "--- $0: X session started for $LOGNAME at $(date)" >&2

[ -f "$USRRES" ] && xrdb -merge $USRRES

urxvtd --quiet --opendisplay --fork

pkill xsunpinyin
xsunpinyin -d

export XMODIFIERS="@im=xsunpinyin"
export GTK_IM_MODULE=xim

xcalib ~/.config/awesome/Lenovo_Thinkpad_Yoga.icc

echo -n Boot time= >&2
cat /proc/uptime >&2

export PULSE_CLIENTCONFIG=/
export PULSE_RUNTIME_PATH=/dev/null/kill-pulseaudio

exec x-window-manager
