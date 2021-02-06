#alias ls='exa -ahl -s type'                             # colorize `ls` output
alias ls='colorls -a --sf --sd' 
alias cat='bat'
alias find='fd'
alias man='tldr'
alias mkdir='mkdir -p'
alias zshreload='source ~/.zshrc'             # reload ZSH
alias shtop='sudo htop'                       # run `htop` with root rights
alias grep='grep --color=auto'                # colorize `grep` output
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias less='less -R'
alias g='git'
alias fzf='fzf --preview "bat --style numbers,changes --color=always {} | head -500"'

alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

alias rm='rm -i'                              # confirm removal
alias cp='cp -i'                              # confirm copy
alias mv='mv -i'                              # confirm move
alias cal='gcal --starting-day=1'             # print simple calendar for current month
alias weather='curl v2.wttr.in'               # print weather for current location (https://github.com/chubin/wttr.in)

alias emc="emacsclient -c"
export VISUAL="emacsclient -c"
export EDITOR="emacsclient -t"

