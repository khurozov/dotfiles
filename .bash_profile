[[ -f ~/.bashrc ]] && . ~/.bashrc

# add '~/.local/bin' an subfolder to path
export PATH="$PATH$(find $HOME/.local/bin -type d -printf :%p)"

export EDITOR="nvim"
export HOSTNAME="$(uname -n)"

eval `ssh-agent -s`

# start hyprland
if [ "$(tty)" = "/dev/tty1" ]; then
    pidof hyprland || hyprland
fi
