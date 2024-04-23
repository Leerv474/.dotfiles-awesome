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
neofetch


export LC_ALL=en_US.UTF-8
export EDITOR=nvim

eval "$(zoxide init --cmd cd zsh)"
### ALIASES
# scripts
alias psd="${HOME}/.dotfiles/scripts/psd.sh"
alias trash="${HOME}/.dotfiles/scripts/trash.sh"
alias quick-git="${HOME}/.dotfiles/scripts/quick-git.sh"

### INFO: for freeglut
glut-compile() {
    g++ "$1" -o "$2" -lGL -lGLU -lglut -lstdc++
}

# directories
alias bmstu="cd ~/Documents/bmstu && la"
alias downloads="cd ~/Downloads && la"
alias docs="cd ~/Documents && la"
alias javacourse="cd ~/Documents/LeeRV-JAVA314 && la"
alias config="cd ~/.config && la"
alias home="cd ~"
alias dotfiles="cd ~/.dotfiles && la"
alias projects="cd ~/Documents/projects && la"
alias practice="cd ~/Documents/practice && la"
alias notes="cd ~/Documents/Notes && la"

# directory management
alias la='ls -lahq --color=auto --no-group'
alias ls='ls -lhq --color=auto --no-group'
alias ..='cd ..'
alias ~='cd ~'
alias сы='cd'

# file management
alias mkf='touch'

open() {
    xdg-open $1 &
}

cdv() {
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

alias vim="nvim"
alias nv="nvim"
alias v="nvim"

cdmkdir() {
    mkdir "$1"
    cd "$1" || exit
}

# system management
alias :q="exit"
alias cdate='date "+%Y-%m-%d %A %H:%M"'
alias sd='shutdown now'
alias cls='clear'
alias ssh='kitten ssh'
alias cat='bat -p'
alias lg='lazygit'
alias py='python'

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

# ctrl backspace
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

stty stop undef
zle_highlight=('paste:none')
unsetopt BEEP
zstyle ':completion:*' menu select completer _history

precmd() {
    source ~/.dotfiles/.zsh/prompt.zsh
}
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
