need to add the following for a prompt to your ~/.bashrc


# jds added for git branch viewing
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\$(parse_git_branch)[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    # export PS1="\[\033[31;38m\]\u@\h\[\033[00m\]:\[\033[31;38m\]\w\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\] "
    export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)$ '
fi
