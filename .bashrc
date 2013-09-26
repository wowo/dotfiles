# below are listed only additions to standard Ubuntu's .bashrc

function qfind {
  if [ -z $2 ]; then
    dir="."
  else
    dir=$2
  fi  
  find $dir -iname *$1*
}



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
  PS1="$YELLOW[\u@\h]$LIGHT_GREEN[\W]$LIGHT_GRAY \$(parse_git_branch)$TEXT\$ "
}
proml

alias qtree="tree -L 2 -hs --dirsfirst"
alias sock='echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"'

FIGNORE=.htaccess:.svn:.git
GREP_OPTIONS="--color=auto"
