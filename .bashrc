# .bashrc
# Tommy Janna

if [[ $- != *i* ]]
then
    # Shell is non-interactive (scp, rcp, ...)
    exit 1
fi

# Source global definitions
if [[ -f /etc/bashrc ]]
then
    source /etc/bashrc
fi

# Source kitty terminal completions
if [[ -x /usr/bin/kitty ]]
then
    source <(kitty + complete setup bash)
fi

# Add user directory to path for custom scripts 
if ! [[ $PATH =~ $HOME/bin ]]
then
    PATH=$PATH:$HOME/bin
fi

HISTCONTORL=ignorespace # History ignores lines beginning with a space, or duplicate lines in history.
shopt -s histappend # Append to history record

# Aliases & Functions
alias h="history | tail"
alias ..="cd .."
alias l="ls -F" # Append indicator (one of */=>@|) to entries
alias la="ls -lahF" # List all hidden on each line with permissions
alias ls="ls --color=auto"

# Void power commands
alias zzz="sudo zzz"
alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"

cdf() {
    cd $(find . -name $1)
}

# Confirm in case of accidental override
# alias mv="mv -i"
# alias cp="cp -i"
# alias rm="rm -i"

# Utilize vi controls in the shell
set -o vi

# Shell prompt and colours
color_prompt=yes

# Prompt
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

# Reassign direcory colour to 1;34 (bold blue)
LS_COLORS=$LS_COLORS:'di=1;34:'

# Just for fun :)
if [[ -x $(command -v neofetch) ]]
then
    neofetch
fi
