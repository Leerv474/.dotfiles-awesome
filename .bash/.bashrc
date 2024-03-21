#
#  ██╗░░░░░███████╗███████╗███╗░░██╗██╗░░░██╗██╗░░██╗  ██████╗░░█████╗░░██████╗██╗░░██╗
#  ██║░░░░░██╔════╝██╔════╝████╗░██║██║░░░██║╚██╗██╔╝  ██╔══██╗██╔══██╗██╔════╝██║░░██║
#  ██║░░░░░█████╗░░█████╗░░██╔██╗██║██║░░░██║░╚███╔╝░  ██████╦╝███████║╚█████╗░███████║
#  ██║░░░░░██╔══╝░░██╔══╝░░██║╚████║██║░░░██║░██╔██╗░  ██╔══██╗██╔══██║░╚═══██╗██╔══██║
#  ███████╗███████╗███████╗██║░╚███║╚██████╔╝██╔╝╚██╗  ██████╦╝██║░░██║██████╔╝██║░░██║
#  ╚══════╝╚══════╝╚══════╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝
#
# if not running interactively, don't do anythin
[[ $- != *i* ]] && return

if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
fi

# colors
BLUE="\033[34m"
### ALIASES
# scripts
alias psd="${HOME}/.dotfiles/.bash/scripts/psd.sh"
alias trash="${HOME}/.dotfiles/.bash/scripts/trash.sh"
alias volume="${HOME}/.dotfiles/.bash/scripts/volume.sh"
alias quick-git="${HOME}/.dotfiles/.bash/scripts/quick-git.sh"

# personal
alias vps-connect="${HOME}/.dotfiles/.bash/scripts/vps-connect"
### INFO: for freeglut
glut-compile() {
    g++ "$1" -o "$2" -lGL -lGLU -lglut -lstdc++
}

# directories
alias bmstu="cd ~/Documents/BMSTU"
alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"
alias javacourse="cd ~/Documents/LeeRV-JAVA314"
alias config="cd ~/.config"
alias home="cd ~"
alias dotfiles="cd ~/.dotfiles"
alias projects="cd ~/Documents/Projects"


# directory management
alias la='ls -lahq --color=auto --no-group'
alias ls='ls -lhq --color=auto --no-group'
alias ..='cd ..'
alias ~='cd ~'
alias сы='cd'


# file management
alias mkf='touch'
alias open='xdg-open'

neovim() {
    if [ -n "$1" ]; then
        if [ -d "$1" ]; then
            cd "$1" || exit 
            nvim .
        elif [ -f "$1" ]; then
            nvim "$1"
        else
            nvim "$1"
        fi
    else
        nvim .
    fi
}

alias nvim="neovim"
alias vim="neovim"
alias nv="neovim"

cdmkdir() {
    mkdir "$1"
    cd "$1" || exit
}

# system management
alias :q="exit"
alias cdate='date "+%Y-%m-%d %A %H:%M"'
alias sd='shutdown now'
alias cls='clear'

# web searching
# search with url
web() {
    firefox "$1"
}
# search in the browser
alias search='${HOME}/.scripts/web-search.sh'

# save session
save() {
    rm ~/.bash_session > /dev/null 2>&1
    pwd > ~/.bash_session
}

load() {
    if [[ $(cat ~/.bash_session | grep "No such file or directory" | wc -c ) -eq 0 ]]; then
        cd "$(cat ~/.bash_session)" || exit
    else
        echo -e "[${BLUE}info\033[0m]: no saved session"
    fi
}


### INFO: bash prompt configuration
#
## history
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTIGNORE='ls:cd:lf:la:history'
export HISTCONTROL=erasedups:ignoredups:ignorespace
shopt -s histappend

# commands
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Ignore case on auto-completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "set colored-stats on"
bind "set colored-completion-prefix on"


## ENVIRONMENT VARIABLES
export EDITOR='nvim'
export VISUAL='nvim'

RESET='\[\033[0m\]'
BOLD='\[\033[1m\]'
FBLUE='\[\[\033[38;2;138;173;244m\]'
PS1=" ${FBLUE}${BOLD}_${RESET} "

# PROMPT_DIRTRIM=3
# update_prompt() {
#     PS1="$("${HOME}/.dotfiles/.bash/scripts/prompt.sh")"
# }
# PROMPT_COMMAND=update_prompt
