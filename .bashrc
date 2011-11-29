# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

PATH=$PATH:~/bin
export PATH

export GREP_OPTIONS="--exclude-dir=\.svn --exclude=tags --color=auto"
export EDITOR=vim

if [ "$COLORTERM" == "gnome-terminal" ]; then
    export TERM=xterm-256color
fi 

export JAVA_HOME=/usr/lib/jvm/java-6-sun 
alias onet="mtr 213.180.146.27"
alias mongo="readline-editor mongo"
#export LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so

mvni()
{
  mvn clean install -Dmaven.test.skip=true "${@}"
}

svndiff()
{
  svn diff "${@}" | colordiff | more
}

svnlog()
{
  svn log "${@}" | more
}

svnst () 
{
  svn st "${@}"
}

qfind ()
{
    SEARCHPATH="."
    if [ -n $2 ]; then 
      SEARCHPATH=$2
    fi  
    find $SEARCHPATH -iname *$1* | grep -v "\.svn"
}


mvni ()
{
    mvn clean install -o -Dmaven.test.skip=true "${@}"
}

export JETTY_HOME=/var/jetty

last_trace ()
{
  ls ~/.java/deployment/log/ -t | head -2 | grep trace | xargs -I{} tail $@ ~/.java/deployment/log/{}
}


export FIGNORE=.svn

GRAILS_HOME=~/bin/grails-1.2.1/
export GRAILS_HOME
PATH=${GRAILS_HOME}bin:$PATH
export PATH

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
 
function proml {
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local      YELLOW="\[\033[0;33m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_PURPLE="\[\033[1;34m\]"
  local         TEXT="\[\e[0;m\]"
  PS1="$YELLOW[\u]$LIGHT_RED[\W]$LIGHT_GRAY \$(parse_git_branch)$TEXT\$ "
}
proml

function qfind {
  if [ -z $2 ]; then
    dir="."
  else
    dir=$2
  fi  
  find $dir -iname *$1*
}

function qgrep {
  if [ -z $2 ]; then
    dir="."
  else
    dir=$2
  fi
  grep -rin $1 $dir
}
GREP_OPTIONS="--color=auto"