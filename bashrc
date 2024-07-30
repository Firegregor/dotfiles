# Comand prompt
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]"

# Git
# . ~/git-completion.bash

# vim mode
set -o vi


# Adding to path without duplicates
pathadd(){
    if [ -d "$1" ] && [[ ! $PATH =~ (^|:)$1(:|$) ]]; then
        PATH+=:$1
    fi
}

alias note=<++>
