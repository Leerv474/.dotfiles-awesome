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

# colors
BLUE="\033[34m"
### ALIASES
# scripts
alias psd="${HOME}/.dotfiles/.bash/scripts/psd.sh"
alias trash="${HOME}/.dotfiles/.bash/scripts/trash.sh"
alias volume="${HOME}/.dotfiles/.bash/scripts/volume.sh"

# personal
alias vps-connect="${HOME}/.dotfiles/.bash/scripts/vps-connect"
### INFO: for freeglut
glut-compile() {
    g++ $1 -o $2 -lGL -lGLU -lglut -lstdc++
}

# directories
alias bmstu="cd ~/Documents/BMSTU"
alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"
alias javacourse="cd ~/Documents/LeeRV-JAVA314"
alias config="cd ~/.config"
alias home="cd ~"
alias dotfiles="cd ~/.dotfiles"


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
            cd "$1" 
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
    mkdir $1
    cd $1
}

# system management
alias :q="exit"
alias cdate='date "+%Y-%m-%d %A %H:%M"'
alias sd='shutdown now'
alias cls='clear'

# add commit push git with the current date 
quick-git () {
    git status
    echo -e "[${BLUE}info\033[0m]: do you want to commit this? [Y/n]: \c" 
    read confirm
    if [[ $confirm = 'y' || $confirm = 'Y' || $confirm = '' ]]; then
        echo -e "[${BLUE}info\033[0m]: adding files"
        git add .
        comDate=$(date "+%d-%m-%Y %H:%M:%S")
        echo -e "[${BLUE}info\033[0m]: commiting \"${comDate}\""
        git commit -m "${comDate}"
        echo -e "[${BLUE}info\033[0m]: pushing files"
        git push
    else
        echo -e "[${BLUE}info\033[0m]: cancelled"
    fi
}

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
        cd $(cat ~/.bash_session)
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


## ENVIRONMENT VARIABLES
export EDITOR='nvim'
export VISUAL='nvim'


### Colorful prompt
# colors
RESET='\[\033[0m\]'
BOLD='\[\033[1m\]'

# foreground
FBLUE='\[\[\033[38;2;138;173;244m\]'
FBASE='\[\033[38;2;30;30;46m\]'
FLAVENDER='\[\033[38;2;180;190;254m\]'
FSURFACE='\[\033[38;2;69;71;90m\]'
FGREEN='\[\033[38;2;64;160;43m\]'
FRED='\[\033[38;2;210;15;57m\]'

# background
BBLUE='\[\[\033[48;2;138;173;244m\]'
BBASE='\[\033[48;2;30;30;46m\]'
BSURFACE='\[\033[48;2;69;71;90m\]'
BCRUST='\[\033[48;2;24;24;37m\]'
BLAVENDER='\[\033[48;2;180;190;254m\]'

# nerd characters 
LEFTF=''
LEFTE=''
RIGHTF=''
RIGHTE=''
DIRICON=''
COMMANDICON=''
GIT=''
CHECK=''
CROSS=''

# Function to get Git branch name
parse_git_info() {
    # Check if Git is detected
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        return
    fi

    local branch=$(git branch 2> /dev/null | sed -n 's/^* //p')
    local status=$(git status --porcelain 2> /dev/null)

    if [ -n "$branch" ]; then
        if [[ "$status" == "" ]]; then
            echo -e "${BLAVENDER}${FBASE} ${GIT} ${branch} ${FGREEN}${CHECK}"
        else
            echo -e "${BLAVENDER}${FBASE} ${GIT} ${branch} ${FRED}${CROSS}"
        fi
    fi
}
PROMPT_DIRTRIM=3

update_prompt() {
    # Check if Git is detected 
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        PS1="${FBLUE}${LEFTF}${FBASE}${BBLUE}${DIRICON}${RESET}${BSURFACE}${FBLUE}${RIGHTF}${BOLD} \w${RESET}${FSURFACE}${RIGHTF}${RESET}\n${FBLUE} ${COMMANDICON}${RESET} "
    else
        PS1="${FBLUE}${LEFTF}${FBASE}${BBLUE}${DIRICON}${RESET}${BSURFACE}${FBLUE}${RIGHTF}${BOLD} \w${RESET}${BLAVENDER}${FSURFACE}${RIGHTF}${RESET}${FLAVENDER}${BOLD}$(parse_git_info)${RESET}${FLAVENDER}${RIGHTF}${RESET}\n${FBLUE} ${COMMANDICON}${RESET} "
    fi
}

PROMPT_COMMAND=update_prompt
