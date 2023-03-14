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
if [[ ! -e ~/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  make -C ~/powerlevel10k pkg
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
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
