#!/usr/bin/bash

[[ -f "$HOME"/.bashrc ]] && source "$HOME"/.bashrc

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
			eval "$(oh-my-posh prompt init bash --config "$POSH_THEMES_PATH"/tokyo.omp.json)"
		else
			echo "cannot find oh-my-posh.exe..."
		fi
	fi
fi

# # if test -f "$env"; then
# function agent_load_env() {
# 	test -f "$env" && . "$env" >|/dev/null
# }

# function agent_start() {
# 	(
# 		umask 077
# 		ssh-agent >|"$env"
# 	) # use -t here for timeout
# 	. "$env" >|/dev/null
# }

# # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
# agent_run_state=$(
# 	ssh-add -l >|/dev/null 2>&1
# 	echo $?
# )

# if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
# 	agent_start
# fi
