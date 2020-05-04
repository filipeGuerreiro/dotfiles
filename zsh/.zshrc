export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="/usr/local/opt/mysql-client/bin:~/.emacs.d/bin:/usr/local/opt/gettext/bin:$JAVA_HOME/bin:$PATH"

alias python="/usr/local/bin/python3"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Load completion config
source $HOME/.zsh/completion.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist
source /Users/JP27322/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/JP27322/.zsh/history.zsh
source /Users/JP27322/.zsh/key-bindings.zsh
source /Users/JP27322/.zsh/aliases.zsh
