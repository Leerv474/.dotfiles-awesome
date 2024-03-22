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


export LC_ALL=en_US.UTF-8

eval "$(zoxide init --cmd cd zsh)"
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


### INFO: ZSH settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

setopt nocaseglob
setopt autocd 
setopt globdots 
setopt nomatch 
setopt menucomplete
setopt interactive_comments

stty stop undef
zle_highlight=('paste:none')
unsetopt BEEP
zstyle ':completion:*' menu select


PROMPT_DIRTRIM=3
precmd() {
    source ~/.dotfiles/.zsh/scripts/prompt.zsh
}
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
