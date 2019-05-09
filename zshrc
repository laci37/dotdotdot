# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam2 blue green cyan '%F{249}'

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'


export PATH="$HOME/workspace/rbenv/plugins/ruby-build/bin:$HOME/workspace/rbenv/bin:$PATH:$HOME/.environment/scripts"
export XILINXD_LICENSE_FILE="/opt/Xilinx/Xilinx.lic"

alias ag="sudo apt-get -y install"
alias ac="apt-cache search"
alias e="vim --remote-silent"
alias vims="vim --servername VIM"
alias ebrc="vim ~/.bashrc"
alias cd..="cd .."
alias és=ls
alias d=display
alias clip=xclip -i -selection clipboard

alias ethd="sudo ifconfig eno1 down"
alias ethu="sudo ifconfig eno1 up"
alias dhcp="sudo dhclient -v eno1"
alias fucking=sudo
alias gf="git commit -am'fix' && git push"
alias funm="sudo systemctl restart NetworkManager"
alias lpass="LPASS_DISABLE_PINENTRY=1 lpass"

#setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
export WORKON_HOME=~/.ve
export PROJECT_HOME=~/turbine
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

fish
