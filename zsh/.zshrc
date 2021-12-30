# =============================================
#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
# =============================================

# =============================================
# use antibody to laod must have plugins (ohmyzsh is toooooo slow!)
# =============================================
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
# or
# brew install antibody
# antibody bundle < ~/Dotfile/zsh/zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# =============================================
# load other useful plugins
# =============================================
. ~/Dotfile/zsh/z.sh

# =============================================
# paths
# =============================================
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# =============================================
# You may need to manually set your language environment
# =============================================
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# =============================================
# alias
# =============================================
alias vim='nvim'
alias vi='vim'
alias v='nvim'
alias ra='ranger'
eval $(thefuck --alias)
alias f='fuck'
alias j='z'
alias c='clear'
alias lg='lazygit'
alias l='ls -lh --color'
alias ll='ls -lh --color'
alias la='ls -lha --color'
alias ..='cd ..'

# =============================================
#fzf functions
# =============================================
fe() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
    }

# fkill - kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# =============================================
# editor settings for ranger
# =============================================
export VISUAL=nvim;
export EDITOR=nvim;
bindkey -e

# =============================================
# conda initialization
# =============================================
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# =============================================
# fzf setup ![This has to be near the bottom]
# =============================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --hidden -g ""'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || ccat --color=always {}) 2> /dev/null | head -500'"
export FZF_COMPLETION_TRIGGER='\'

# =============================================
# finally load a super fast theme ![This has to be at the bottom]
# =============================================
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b ~/.local/bin
# brew install starship
export STARSHIP_CONFIG=~/Dotfile/starship/starship.toml
eval "$(starship init zsh)"

