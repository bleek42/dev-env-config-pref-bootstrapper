#!/usr/bin/env bash

test -f "$HOME"/.profile && source "$HOME"/.profile
test -f "$HOME"/.bashrc && source "$HOME"/.bashrc

if [ "$TERM_PROGRAM" = "vscode" ]; then
	eval "$(oh-my-posh prompt init bash --config "${POSH_THEMES_PATH}"/tokyo.omp.json)"
fi

if [ -n "$WT_SESSION" ]; then
	export DISPLAY=:0
	export COLORTERM="truecolor"
	export INIT_WT_SESSION="$WT_SESSION"

	if tty -s && [[ "$INIT_WT_SESSION" = "$WT_SESSION" ]] && command -v neofetch >/dev/null 2>&1; then
		neofetch
	fi

	if command -v oh-my-posh >/dev/null 2>&1; then
		alias omp='oh-my-posh'

		case "$WT_PROFILE_ID" in
		"{22cf8483-2f1e-4eb2-b9d2-1459fdfc8b94}")
			eval "$(oh-my-posh prompt init bash --config "${HOME}"/.custom-lambda-gen.omp.json)"
			;;
		"{46ca431a-3a87-5fb3-83cd-11ececc031d2}")
			eval "$(oh-my-posh prompt init bash --config "${POSH_THEMES_PATH}"/kali.omp.json)"
			;;
		*) ;;
		esac
	fi
fi

# OhMyPosh! terminal prompt alias, custom prompt style in easy JSON config file formats
# OhMyPosh config ".omp.json" file in users home dir
# check if the cmd.exe exists in users $PATH
# 		elif [ "$WT_PROFILE_ID" = "" ]; then
# 			eval "$(omp prompt init bash --config "${POSH_THEMES_PATH}"/tokyo.omp.json)"
# 		else
# 			echo "cannot find oh-my-posh.exe..."
# 		fi
# 	fi
# fi
