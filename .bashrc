# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignorespace

# Prompt
if [[ $UID = 0 ]]; then
  PS1="\[\033[1;31m\]\w > \[\033[0m\]" #red
else
  PS1="\[\033[1;36m\]\w > \[\033[0m\]" #cyan
fi

lff() {
  tmp="$(mktemp)"
  # `command` is needed in case `lfcd` is aliased to `lf`
  command lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
}

# Aliases

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -mt'
alias mirrors='sudo reflector -l 30 -f 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias orphans='sudo pacman -Rnsc $(pacman -Qtdq)'
alias yt='yt-dlp --embed-subs --embed-metadata --embed-thumbnail -f "best[height<=1080][ext=mp4][acodec!=none]"'
alias speedtest="curl -o /dev/null cachefly.cachefly.net/100mb.test"
alias rsync='rsync -vrPlu'

fastfetch
