# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================
# paths
# =============================================
export PATH=$HOME/.local/bin:$PATH

# mac specific path
export PATH=/opt/homebrew/bin:$PATH

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
alias c='clear'
alias l='ls -lh --color'
alias ll='ls -lh --color'
alias la='ls -lha --color'
alias ..='cd ..'

# mac specific alias
alias lg='lazygit'
alias ra='ranger'
eval $(thefuck --alias)
alias f='fuck'

# =============================================
# editor settings for ranger
# =============================================
export VISUAL=nvim;
export EDITOR=nvim;
bindkey -e

# =============================================
# plugin setting
# =============================================
# Load plugins.
source ~/Dotfile/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Dotfile/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/Dotfile/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/Dotfile/zsh/zsh-z/zsh-z.plugin.zsh
# z setting
ZSHZ_CMD="j"

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
# activate p10k
# =============================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
