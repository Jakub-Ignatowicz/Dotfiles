# p10k

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autocomplete

source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# highlithing

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases

alias ls='colorls'
alias lsa='colorls -a'
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
