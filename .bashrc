# Tommy Janna
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTCONTORL=ignoreboth # History ignores lines beginning with a space, or duplicate lines in history.
shopt -s histappend # Append to history record

# User specific aliases and functions
alias l="ls -F" # Append indicator (one of */=>@|) to entries
alias la="ls -lah" # List all hidden on each line with permissions
alias h="history | tail"
alias ..="cd .."
alias rm="rm -i"
# Confirm in case of accidental override
alias mv="mv -i"
alias cp="cp -i"

# Utilize vi controls in the shell
set -o vi

# Shell prompt and colours
color_prompt=yes
# gruvbox-dark theme by Pavel Pertsev, github: @morhetz
# If theme doesn't exist, install it from online script.
GCONF="${GCONF:-$(command -v gconftool-2 | xargs echo)}"
if [[ $(${GCONF} --get ~/gruvbox) != true ]]; then
    ${GCONF} --set ~/gruvbox --type=bool true
    URL="https://github.com/Mayccoll/Gogh/blob/msater/themes/gruvbox-dark.sh"
    if [[ "$(uname)" = "Darwin" ]]; then # Use curl on macOS
        bash -c "$(curl -so- "${URL}")"
    else # Use wget on Linux
        bash -c "$(wget -qO- "${URL}")"
    fi
fi

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
export PS1="\[${WHITE}\][\u\[${GREY}\]@\\[${WHITE}\]\h: \[${BBLUE}\]\W\[${WHITE}\]]\[${BGREEN}\]\\$ \[${WHITE}\]"

# Alternative
# export PS1="[\e[33m\u\e[37m@\e[36m\h\e[39m: \e[1m\W\e[0m]\e[1;34m\\$ \e[0;39m"

# Reassign direcory colour to 1;34 (bold blue)
export LS_COLORS=$LS_COLORS:'di=1;34:'

# User override alias file if exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -x "$(command -v neofetch)"  ]; then
    neofetch
fi
