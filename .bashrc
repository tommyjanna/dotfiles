# .bashrc
# Tommy Janna

# Do not run this script if the shell is non-interactive (scp, rsync, ...).
# Remove 'i' from the shell's launch options string and see if it changed.
if [ "${-#*i}" == $- ]
then
    exit 1
fi

# Source global definitions.
if [ -f /etc/bashrc ]
then
    source /etc/bashrc
elif [ -f /etc/bash.bashrc ]
then
    source /etc/bash.bashrc
fi

# Source kitty terminal completions.
if [ -x /usr/bin/kitty ]
then
    source <(kitty + complete setup bash)
fi

###############################
### Environment and Options ###
###############################
# Add user directory to path if it is not there already.
if ! [[ $PATH =~ $HOME/.local/bin ]]
then
    PATH=$PATH:$HOME/.local/bin
fi

# History ignores lines beginning with a space, or duplicate lines in history.
HISTCONTORL=ignorespace 
HISTSIZE=20000

# Append to history record.
shopt -s histappend 

# Reassign direcory colour to 1;34 (bold blue).
LS_COLORS=$LS_COLORS:'di=1;34:'

# Use vi controls in the shell.
set -o vi
bind '"jk":vi-movement-mode'
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

###############
### Aliases ###
###############
alias h="history | tail"
alias ..="cd .."
alias l="ls -F" # Append indicator (one of */=>@|) to entries.
alias la="ls -lahF"
alias ls="ls --color=auto"

# Void power commands
alias zzz="sudo zzz"
alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"

#################
### Functions ###
#################
# cd to the directories from the find command
cdf() {
    #result=( $(find . -type d -name "$1" -print0) )
    readarray -d '' result < <(find . -name "$1" -print0)

    if [ ${#result[@]} -gt 1 ]
    then
        # More than one match, list all the directories and offer the user a
        # choice
        for (( i=1; i < ${#result[@]} + 1; i++ ))
        do
            echo "$i) ${result[i - 1]}"
        done

        read -p $'\nSelect a directory (-1 to exit)\n>: ' directoryIndex
        if [ $directoryIndex -gt ${#result[@]} ]
        then
            echo "Selection is out of bounds" >&2
        elif [ $directoryIndex -gt 0 ]
        then
            cd "${result[directoryIndex - 1]}"
        fi
    else
        if [ ! -z "$result" ]
        then
            cd "$result"
        fi
    fi
}

# Create and immediately cd to new directory
mkdirc() {
    mkdir -p $1

    if [ $? -eq 0 ]
    then
        cd $1
    fi
}

# Automatically disown GUI background proesses
gbck() {
    $@ &
    disown $!
}

# Search history
hgrep() {
    history | grep $1
}

##############
### Prompt ###
##############
# Shell prompt and colours
color_prompt=yes

# \u    user
# \h    host
# \W    working directory
# \e[   begin colour
# a;b   colour pair (a=0 normal, a=1 bold) (b=30-39)
# m     end colour

# Text colors
GREEN="\e[0;32m"
GREY="\e[0;37m"
WHITE="\e[0;39m"

# Bold
BGREEN="\e[1;32m"
BBLUE="\e[1;34m"

# Prompt
PS1="\[${WHITE}\][\u\[${GREY}\]@\\[${WHITE}\]\h: \[${BBLUE}\]\W\[${WHITE}\]]\[${BGREEN}\]\\$ \[${WHITE}\]"

# Alternative
# PS1="[\e[33m\u\e[37m@\e[36m\h\e[39m: \e[1m\W\e[0m]\e[1;34m\\$ \e[0;39m"
