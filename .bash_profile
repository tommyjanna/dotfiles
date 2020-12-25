# .bash_profile
# Tommy Janna

# If logging into tty1 with a display, launch bspwm
if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]
then
    exec startx
fi

if [[ -f ~/.bashrc ]]
then
    . ~/.bashrc
fi
