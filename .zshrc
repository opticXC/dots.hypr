if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/usr/share/oh-my-zsh"


ZSH_THEME=



zstyle ':omz:update' mode reminder  # just remind me to update when it's time

zstyle ':omz:update' frequency 14


HIST_STAMPS="yyyy/mm/dd"


plugins=(
    git git-extras 
    archlinux 
    adb 
)

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

source $HOME/.config/zsh/config.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
  source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

