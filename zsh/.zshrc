# =============================================
# paths
# =============================================
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

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

# If not in tmux, start tmux.
if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
  exec tmux
fi

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
if [[ ! -e ~/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
  zcompile-many ~/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi
if [[ ! -e ~/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/zsh-autosuggestions
  zcompile-many ~/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.p10k.zsh

# =============================================
# load autojump plugin
# =============================================
. ~/Dotfile/zsh/z.sh

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
# zsh autosuggestions color settings
# =============================================
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

# =============================================
# finally load a super fast theme ![This has to be at the bottom]
# =============================================
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b ~/.local/bin
# brew install starship
export STARSHIP_CONFIG=~/Dotfile/starship/starship.toml
eval "$(starship init zsh)"
