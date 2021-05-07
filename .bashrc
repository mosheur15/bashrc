#! /usr/bin/bash

# enable git branch
# if the directory is init as a git repo it will show
# a circle with color depending on branch name.
# red is for master/main otherwise green.
function __get_emoji(){
    local BRANCH_NAME=$(git branch --show-current 2> /dev/null)
    local BRANCH_EMOJI=" "
    
    if [ ! -z $BRANCH_NAME ]; then
        if [ "${BRANCH_NAME}" = "master" ] || [ "${BRANCH_NAME}" = "main" ]; then
            BRANCH_EMOJI=" [\[\e[31m\]●\[\e[0m\]λ] "
        else
            BRANCH_EMOJI=" [\[\e[32m\]●\[\e[0m\]λ] "
        fi
    fi
    
    echo -e "$BRANCH_EMOJI"
}

# set ps1 everytime any command run by user
# for tracking directory.
function __set_prompt(){
    PS1="\[\e[0;32m\]\w\[\e[0m\]$(__get_emoji)\[\e[0;97m\]\$\[\e[0m\] "
}

# set the function as prompt command so it can run
# everytime any command is given.
PROMPT_COMMAND=__set_prompt

# usefull alias.
alias py=$PREFIX/bin/python3
alias ipy=$PREFIX/bin/ipython3
alias sd="cd /sdcard"
alias cn="ping -c 5 google.com"
