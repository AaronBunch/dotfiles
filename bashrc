export PATH=${PATH}:/usr/local/mysql/bin
export PATH=${PATH}:/Users/aaronbunch/shell_scripts

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source ~/.iterm2_shell_integration.`basename $SHELL`

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias la='ls -aF'
alias ll='ls -alF'

# added by Anaconda2 4.3.1 installer
export PATH="/Users/aaronbunch/anaconda/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
