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
ZSHZ_CMD='j'
source ~/Dotfile/zsh/zsh-z/zsh-z.plugin.zsh

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
# nnn settings
# =============================================
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# =============================================
# activate p10k
# =============================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/Dotfile/zsh/.p10k.zsh
