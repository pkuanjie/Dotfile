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
# brew install antibody
# antibody bundle < ~/Dotfile/zsh/zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# =============================================
# load other useful plugins
# =============================================
. ~/Dotfile/zsh/z.sh

# =============================================
# add case insensitive command completion like the default behavior of ohmyzsh
# =============================================
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

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
# Use ; as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER=';'

# =============================================
# finally load a super fast theme ![This has to be at the bottom]
# =============================================
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b ~/.local/bin
# brew install starship
export STARSHIP_CONFIG=~/Dotfile/starship/starship.toml
eval "$(starship init zsh)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

