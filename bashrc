alias vim='nvim'
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
alias ld='ls -d */'
alias bashrc='vim ~/.bashrc'
alias bash_profile='vim ~/.bash_profile'
alias reload='source ~/.bash_profile'

PS1="\[\e[36m\]\t \[\e[34m\]\h:\[\e[32m\]\W"
PS1+="\[\e[33;48m\]>\[\e[m\] "
export PS1


alias pi='ssh pi@10.0.1.2'
