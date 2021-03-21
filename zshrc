
alias py='python3'
alias vim='nvim'
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lh'
alias ld='ls -d */'
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias tmux_config='vim ~/.tmux.conf'
alias reload='source ~/.zshrc'

PROMPT='%F{46}%* %F{blue}%m:%F{214}%C%f> '


# navigatin
alias projects='cd ~/Projects'

  #/usr/local/share/zsh/site-functions
  #
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

[[ -r ~/Projects/autopkg_complete/autopkg ]] && source ~/Projects/autopkg_complete/autopkg
