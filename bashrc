alias vim='nvim'
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
alias ld='ls -d */'
alias bashrc='vim ~/.bashrc'
alias bash_profile='vim ~/.bash_profile'
alias reload='source ~/.bash_profile'

PS1="\[\e[36m\]\t \[\e[32m\]\u@\[\e[93m\]\h:\[\e[32m\]\W"
PS1+="\[\e[33;48m\]>\[\e[m\] "
export PS1


# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
