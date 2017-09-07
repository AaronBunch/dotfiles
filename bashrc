export PATH=${PATH}:/usr/local/mysql/bin

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source ~/.iterm2_shell_integration.`basename $SHELL`

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias la='ls -a'
alias ll='ls -al'

# added by Anaconda2 4.3.1 installer
export PATH="/Users/aaronbunch/anaconda/bin:$PATH"
