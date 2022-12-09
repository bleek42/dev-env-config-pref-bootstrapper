#!/usr/bin/bash

# cd into usr home, sys root dir
alias hm='cd ~'
alias rt='cd /'

# the '-' is for opt flags; not the actual cmd...
alias codei='code-insiders'

# much easier to type out that...
alias winup='winget upgrade --all'
alias scup='scoop update --all'
alias printpath='echo $PATH | sed "s/:/\n/g" | sort | uniq -c'

if command -v bat >/dev/null 2>&1; then
	alias cat=bat
fi

if command -v pnpm >/dev/null 2>&1; then
	alias npm='pnpm'
fi

# Show full paths of files in current directory
alias paths='ls -d $PWD/*'

if command -v exa >/dev/null 2>&1; then
	echo "exa cmd exists in PATH: exa is the new ls"
else

	# --show-control-chars: help showing Korean or accented characters

	alias ls='ls -F --color=auto --show-control-chars'
	alias ll='ls -l'

	# Show hidden files too
	alias la='ls -A'
	# Show file size, permissions, date, etc.
	alias ll='ls -lvhs'
	alias lll='ls -alvhs'
	# Show only directories
	alias l.='ls -d */'
	# sort files by size, showing biggest at the bottom
	alias lsort="ls -alSr | tr -s ' ' | cut -d ' ' -f 5,9"

	# typo correction
	alias l='ls'
	alias s='ls'
	alias sl='ls'
	# For fun: the ls ligature
	alias ʪ='ls'
fi

if [[ -f "package.json" ]] && command -v ultra >/dev/null 2>&1; then
	alias npm='ultra'
	echo "local package.json file detected: using ultra for npm commands..."
fi

alias diff="colordiff"
alias unicode=getunicodec
alias ip=ipf

# ═══════════════════════════════════════
# FILE MANAGEMENT ALIASES
# ═══════════════════════════════════════
# don't clobber files or ruin the OS
alias cp='cp -i'
alias mv='mv -i'
alias rm="rm -I --preserve-root"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias mntwin='sudo mount -t ntfs /dev/nvme0n1p3 /mnt/'

# make directory and any parent directories needed
alias mkdir='mkdir -p'

# easier directory jumping
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# typo fix
alias cd..='cd ..'

# ═══════════════════════════════════════
# RELOAD .BASHRC
# ═══════════════════════════════════════
alias sb='source ~/.bashrc'

# ═══════════════════════════════════════
# OS POWER MANAGEMENT
# ═══════════════════════════════════════
# easy shutdown/reboot
alias reboot="sudo /sbin/reboot"
alias shutdown="sudo /sbin/shutdown"

# ═══════════════════════════════════════
# DISK UTILS
# ═══════════════════════════════════════
# make common commands easier to read for humans
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mth"

# ═══════════════════════════════════════
# TIME AND DATE
# ═══════════════════════════════════════
# easy time and date printing
alias now='date +"%T"'
alias dt='date "+%F %T"'

# ═══════════════════════════════════════
# PRETTY THINGS
# ═══════════════════════════════════════
# custom cmatrix
alias cmatrix="cmatrix -bC yellow"

# ═══════════════════════════════════════
# PROCESS MANAGEMENT
# ═══════════════════════════════════════
# search processes (find PID easily)
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
# show all processes
alias psf="ps auxfww"
#given a PID, intercept the stdout and stderr
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"

# Show active http connections
alias ports='echo -e "\n${ECHOR}Open connections :$NC "; netstat -pan --inet;'
# ═══════════════════════════════════════
# NETWORKS AND FILES
# ═══════════════════════════════════════
# make wget continue downloads if inturrupted
alias wget="wget -c"
# # ═══════════════════════════════════════
# # SSH ALIASES
# # ═══════════════════════════════════════
# # So as to not expose my ip addresses of interest on GitHub
# if [[ -f ~/.ssh_aliases ]]; then source ~/.ssh_aliases; fi

# ═══════════════════════════════════════
# BOOKMARKING SYSTEM
# ═══════════════════════════════════════
# use to get current directory with spaces escaped
alias qwd='printf "%q\n" "$(pwd)"'

case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7; do
		case "$(type -p "$name".exe 2>/dev/null)" in
		'' | /usr/bin/*) continue ;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac
