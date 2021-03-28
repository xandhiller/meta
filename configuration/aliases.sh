#! /bin/sh --

alias vim='nvim'
alias grep='grep --color=auto'
alias ccat='highlight --force --style=$HIGHLIGHT_STYLE --out-format=ansi'
alias VISUAL='nvim'
alias EDITOR='nvim'
#alias ag='sudo apt-get'
#alias agi='sudo apt-get install'
#alias ags='apt-cache search'
#alias ref='source ~/.config/fish/config.fish'
alias r='ranger'
alias e='exit'
alias c='clear'
alias l='ls -1'
alias ll='ls -1a'
alias lsa='la -a'

# CLI Program Shortcuts
alias yt='youtube-dl --add-metadata -ic' # Download video
alias yta='youtube-dl --add-metadata -xic' # Download audio
alias tr='tree'
alias t='tree'
alias record='ffmpeg -f x11grab -s 1600x900 -i :0.0 ~/Videos/screenRecording.mkv'
alias mdc='mathdoc'
alias vlib='vim /usr/share/vim/vim74/doc/'
alias scs='scrot -s' # Take selection screenshot
#alias txb='cd ~/Documents/Textbooks'

# Config Files
alias brc='vim ~/.bashrc'
alias frc='vim ~/.config/fish/config.fish'
alias rrc='vim ~/.config/rofi/config'
alias vrc='nvim ~/.config/nvim/init.vim'
alias it='vim ~/.config/i3/config'
alias ebsct='vim ~/GitHub/configuration/shortcuts.sh'  # Bash Shortcuts
alias ekr='vim ~/GitHub/configuration/keyRemaps.sh'
alias zrc='vim ~/.config/zathura/zathurarc'
alias br='vim /sys/class/backlight/intel_backlight/brightness'
alias scr='cd ~/Meta/scripts'
#alias fundc='cd ~/Documents/fundc/'

# Viewing shorcuts in terminal
alias als='ccat ~/Meta/configuration/aliases.sh' 
alias kr='ccat ~/Meta/configuration/keyRemaps.sh'
alias dict='dict -d gcide'
alias thes='dict -d moby-thesaurus'

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias zrc="nvim ~/.zshrc"
alias al="nvim ~/Meta/configuration/aliases.sh"
alias nfind="find . -name" 
alias tm="nvim ~/.tmux.conf"
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"
alias cdddddd="cd ../../../../../"
alias rg="grep -r"
alias firm="cd ~/Documents/Software/morse_firmware"
alias soft="cd ~/Documents/Software"
alias sys="cd ~/Documents/Software"
