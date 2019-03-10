# The following lines were added by compinstall
zstyle :compinstall filename '/home/wowo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
alias ll='ls -lFh'
alias la='ls -A'
alias l='ls -CF'

# GIT in Prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
setopt PROMPT_SUBST
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1d %{$reset_color%}%% "
RPROMPT='%{$fg[cyan]%}${vcs_info_msg_0_}%{$reset_color}'

bindkey -v
bindkey '^R' history-incremental-search-backward
