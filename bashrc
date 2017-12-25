alias py='python3'
alias nv='nvim'
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
alias ld='ls -d */'
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
#export PS1='\h:\W \u\$'
export PS1="\[\e[34m\]\h\[\e[m\]:\[\e[32m\]\W\[\e[m\] \[\e[33;48m\]>\[\e[m\] "

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
