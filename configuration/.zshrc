#! /usr/bin/zsh --
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar



# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
#
# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias ls='ls --color=auto'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'
# 
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

source $HOME/Meta/configuration/aliases.sh
# export RISCV_OPENOCD_PATH=/opt/riscv-openocd-0.10.0-2018.12.0-x86_64-linux-ubuntu14
export RISCV_OPENOCD_PATH=/opt/riscv-openocd-0.10.0-2020.12.1-x86_64-linux-ubuntu14  # version 0.11
export RISCV_PATH=/opt/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14
export RISCV=$RISCV_PATH
export CLANG_STATIC_ANALYSIS_PATH=/opt/clang-riscv-10.0.0-2019.12.24
export PATH=$PATH:$RISCV_PATH/bin:$RISCV_OPENOCD_PATH/bin:$CLANG_STATIC_ANALYSIS_PATH/bin

export ZSH="/home/alex/.oh-my-zsh"
PROMPT='%{$fg[green]%}%~%{$fg_bold[blue]%} $(git_prompt_info)%{$reset_color%} '
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#303030'
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME="default"
export ANTIGEN_LOG=/home/alex/Meta/configuration/antigen.log
source $HOME/Meta/configuration/antigen.zsh

# Load the oh-my-zsh's library.

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle softmoth/zsh-vim-mode
# Tell Antigen that you're done.
antigen apply
# So that vim mode works correctly on CLI
KEYTIMEOUT=1

if [ `hostname` = "nebuchadnezzar" ]
then
    PATH="$PATH:/homebrew/anaconda3/bin"
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew/lib/pkgconfig/:/opt/homebrew/share/pkgconfig/
fi

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
   eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
            ## <<< conda initialize <<<

export VISUAL=nvim 
export EDITOR="$VISUAL"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew/lib/pkgconfig/:/opt/homebrew/share/pkgconfig/
export AGDA_DIR=$HOME/.agda
####################
# Work tools
####################
export RISCV_OPENOCD_PATH=/opt/riscv-openocd-0.10.0-2018.12.0-x86_64-linux-ubuntu14
export RISCV_PATH=/opt/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14
export RISCV=$RISCV_PATH
export CLANG_STATIC_ANALYSIS_PATH=/opt/clang-riscv-10.0.0-2019.12.24
export RISCV_OPENOCD_PATH=/opt/riscv-openocd-0.10.0-2018.12.0-x86_64-linux-ubuntu14
export RISCV_PATH=/opt/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14
export PATH=$PATH:$RISCV_PATH/bin:$RISCV_OPENOCD_PATH/bin:$CLANG_STATIC_ANALYSIS_PATH/bin
export PATH=$PATH:/usr/local/MATLAB/R2019a/bin
export PATH=$PATH:/usr/local/Wolfram/Mathematica/13.0/Executables
export HIGHLIGHT_STYLE=fruit  # for `highlight` during `cat`-ing files.
####################
# $PATH appending
####################
export PATH=$PATH:$HOME/Meta/scripts
export PATH=$PATH:$HOME/.local/bin
####################
# FOSS IC tools
####################
export PATH=$PATH:/opt/iverilog/bin
export PATH=$PATH:/opt/xschem/bin
export PATH=$PATH:/opt/magic/bin
export PATH=$PATH:/opt/netgen/bin
export PATH=$PATH:/opt/qflow/bin
####################
# Custom python libs
####################
export PYTHONPATH=$HOME/alex/Documents/Analog/morseinstruments:$HOME/alex/Documents/Analog/tuna:$HOME/alex/Documents/Analog/igor:$HOME/Work/STDFReader:$HOME/Work/tuna:$HOME/Work/ate/ate_database_parser
# export PYTHONPATH=$HOME/Work/tuna:$HOME/Work/morseinstruments

export _JAVA_AWT_WM_NONREPARENTING=1
export BASE_DIR=$HOME/Documents/Analog
export FONTCONFIG_PATH=/etc/fonts
source $HOME/Work/.work_zshrc

####################
# Do last
####################
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux
#fi
