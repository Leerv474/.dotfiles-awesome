#
# ██╗░░░░░███████╗███████╗███╗░░██╗██╗░░░██╗██╗░░██╗  ███████╗░██████╗██╗░░██╗
# ██║░░░░░██╔════╝██╔════╝████╗░██║██║░░░██║╚██╗██╔╝  ╚════██║██╔════╝██║░░██║
# ██║░░░░░█████╗░░█████╗░░██╔██╗██║██║░░░██║░╚███╔╝░  ░░███╔═╝╚█████╗░███████║
# ██║░░░░░██╔══╝░░██╔══╝░░██║╚████║██║░░░██║░██╔██╗░  ██╔══╝░░░╚═══██╗██╔══██║
# ███████╗███████╗███████╗██║░╚███║╚██████╔╝██╔╝╚██╗  ███████╗██████╔╝██║░░██║
# ╚══════╝╚══════╝╚══════╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚══════╝╚═════╝░╚═╝░░╚═╝

autoload -Uz compinit promptinit
compinit
promptinit

### ALIASES
# scripts
alias psd="${HOME}/.dotfiles/.bash/scripts/psd.sh"
alias trash="${HOME}/.dotfiles/.bash/scripts/trash.sh"
alias volume="${HOME}/.dotfiles/.bash/scripts/volume.sh"
alias quick-git="${HOME}/.dotfiles/.bash/scripts/quick-git.sh"

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


PROMPT_DIRTRIM=3
precmd() {
    source ~/.dotfiles/.zsh/scripts/prompt.zsh
}
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
