alias ll='ls -l'
alias la='ls -A'
alias l='ls'
alias lh='ls -lh'
alias sd='saidar -cd1'

alias evince='evince 2>/dev/null'
alias zathura='zathura --fork 2>/dev/null'
alias xsel='xsel -l /dev/null'

alias wpa_cli='/sbin/wpa_cli'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias matlab='wmname LG3D; ~/matlab/bin/matlab -nodesktop -nosplash'

alias sshproxy='ssh -qfN -D localhost:10022 -o ExitOnForwardFailure=yes'
alias viproxy='vi ~/.config/chromium/proxy.js'

alias bat='cd /sys/class/power_supply/; grep . BAT?/capacity; cd - >/dev/null'

alias dp2above='xrandr --output eDP1 --auto --primary --output DP2 --auto --above eDP1'
alias dp2='xrandr --output eDP1 --auto --primary --output DP2 --auto --same-as eDP1'
alias edp1='xrandr --output eDP1 --auto --primary --output DP2 --off'

alias indigo='. /opt/ros/indigo/setup.bash'
alias hydro='. /opt/ros/hydro/setup.bash'

alias gdb='gdb -quiet'
