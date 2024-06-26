#! /usr/bin/zsh

if [ -d /ust/share/doc/find-the-command ]
then
    source /usr/share/doc/find-the-command/ftc.zsh
fi


export EDITOR=nvim

# Aliases
alias neofetch="/usr/bin/fastfetch"
alias ls="/usr/bin/eza --all --long --git --icons=auto --group-directories-first"

alias cat="/usr/bin/bat --style header --style snip --style changes --style header"
alias grep="/usr/bin/rg"

alias grub-update="sudo /usr/bin/grub-mkconfig -o /boot/grub/grub.cfg"

## clang set
#C_OPTS="-O3 -march=native -mtune=native -pipe -std=c17"
#CXX_OPTS="$C_OPTS -std=c++2a"
#export CFLAGS="$C_OPTS"
#export CXXFLAGS="$CXX_OPTS"
#export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now, -fuse-ld=lld"
#export CC=clang
#export CXX=clang++

#alias cc="clang $CFLAGS"
#alias cxx="clang++ $CXXFLAGS"

alias vim="nvim"
alias vi="nvim"


# Path Manipulation
if [ -d $HOME/.local/bin ]
then
    PATH+=:$HOME/.local/bin
fi

# adding cargo bin to path if exists
if [ -d $HOME/.cargo/bin ]
then
    PATH+=:$HOME/.cargo/bin
fi

# adding flutter bin to path if exists
if [ -d /opt/flutter ]
then
    PATH+=:/opt/flutter/bin
fi


if [ -d $HOME/.ghcup ]
then
    PATH+=:$HOME/.ghcup/bin         
fi

if [ -d $HOME/.bun/bin ]
then
    PATH+=:$HOME/.bun/bin/
fi

if [ -d $HOME/.encore/bin ]
then
    PATH+=:$HOME/.encore/bin/
fi

if [ -d $HOME/go ]
then
	PATH+=:$HOME/go/bin
fi


export PATH=$PATH


## terminal colors
## Not recommended
## Ruins standard 16 colors in most cases
#if [ -d $HOME/.cache/wal ]
#then
#    (/usr/bin/cat $HOME/.cache/wal/sequences &)
#fi


if [ -f "$(which mcfly)" ] 
then
    export MCFLY_KEY_SCHEME=vim
    export MCFLY_FUZZY=2
    eval "$(mcfly init zsh)"
fi

if [ -f "$(which zoxide)" ]
then
	eval "$(zoxide init zsh)"
fi


function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd


if [ -d $HOME/.opam ]
then
	eval $(opam env --switch=default --shell=zsh)
fi



OS_ID=$(/usr/bin/lsb_release -si)
if [ $OS_ID = "Arch" ]
then
	update-mirrors(){
		sudo /usr/bin/reflector --latest 15 --age 15 --sort rate --connection-timeout 15 --download-timeout 15  --save /etc/pacman.d/mirrorlist --verbose
	}
fi

