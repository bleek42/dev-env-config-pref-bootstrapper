#!/usr/bin/bash

test -f "$HOME"/.profile && source "$HOME"/.profile
test -f "$HOME"/.bashrc && source "$HOME"/.bashrc

config_dir="$HOME/.config"

if [ -d "$config_dir/bash" ]; then
	for script in "$config_dir"/bash/*.sh; do
		source "$script"
	done
fi

if [ "$TERM_PROGRAM" = "vscode" ]; then
	unset "$WT_SESSION"
	unset "$WT_PROFILE_ID"
	if command -v oh-my-posh >/dev/null 2>&1; then
		alias omp='oh-my-posh'
		eval "$(oh-my-posh prompt init bash --config "${POSH_THEMES_PATH}"/tokyo.omp.json)"
	else
		echo "cannot find oh-my-posh.exe..."
	fi
fi

if [ -n "$WT_SESSION" ]; then
	export COLORTERM="truecolor"
	if command -v neofetch >/dev/null 2>&1; then
		neofetch
	else
		echo "cannot find neofetch.exe..."
	fi
	# OhMyPosh! terminal prompt alias, custom prompt style in easy JSON config file formats
	# OhMyPosh config ".omp.json" file in users home dir
	# check if the cmd.exe exists in users $PATH
	if command -v oh-my-posh >/dev/null 2>&1; then
		alias omp='oh-my-posh'
		if [ "$WT_PROFILE_ID" = "{171eae9f-9b88-4490-9fc0-01da8d227201}" ]; then
			eval "$(oh-my-posh prompt init bash --config "${HOME}"/.custom.omp.json)"
		elif [ "$WT_PROFILE_ID" = "{7ea1a638-2230-4e4f-a668-5376c63537cc}" ]; then
			eval "$(oh-my-posh prompt init bash --config "${POSH_THEMES_PATH}"/tokyo.omp.json)"
		else
			echo "cannot find oh-my-posh.exe..."
		fi
	fi
fi
