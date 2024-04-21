#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias btw='neofetch'
alias btw-s='neofetch --ascii_distro arch_small --disable Host --disable resolution --disable cpu --disable gpu --disable memory --disable uptime'
alias bckp='sudo /home/jonas/sh/bckp.sh'
alias menu='/home/jonas/sh/menu.sh'
alias todo='/home/jonas/.sh/todo.sh'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias tree='tree -C'
alias e='exit'
alias sc='grim -g "$(slurp)"; read -p "name of file (also append filetype): " input; mv *_grim.png $input'

alias ex='vim ~/studium/physik_111-511/physik_311/notes_physik_311.tex'
alias mathe='vim ~/studium/math_141-341/math_341/notes_math_341.tex'
alias theo='vim ~/studium/physik_221-521/physik_321/notes_physik_321.tex'

PS1='┌ (\u @ \h) - $PWD - \$ \n└── '
#PS1='\e[3m \e[1m (\u @ \h) - $PWD - \$ \n -> '
PS2='=> '

shopt -s checkwinsize

set colored-stats on
set print-completions-horizontally on

#export MOZ_ENABLE_WAYLAND="1"
export EDITOR=vim
export XDG_CURRENT_DESKTOP=Sway
export PATH=/home/jonas/.local/bin:$PATH
#export TEXMFCNF='/home/jonas/.config:/usr/share/texmf-dist/web2c'
