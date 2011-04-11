# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias df='pydf'
alias man='LC_ALL=ru_RU.UTF-8 man'
PS1='[ \[\033[0;0;1;36m\]\W\[\033[0m\] ] '
eval `dircolors -b`
export GREP_COLOR="1;33"
export MANPAGER="/usr/bin/most -s"
complete -cf sudo
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -a'
PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin/"
