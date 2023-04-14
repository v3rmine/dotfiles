#!/bin/bash
# shellcheck disable=2034

# colors
c_black="\033[30m"
c_red="\033[31m"
c_green="\033[32m"
c_yellow="\033[33m"
c_blue="\033[34m"
c_purple="\033[35m"
c_cyan="\033[36m"
c_white="\033[37m"
c_reset="\033[0m"
c_bold="\033[1m"
c_reset_bold="\033[22m"

# --- Logger helpers ---
logger() { printf "%b: [$(date +%Y-%m-%dT%H:%M:%S)] %b\n" "$1" "$2"; }
error() { logger "${c_red}${c_bold}ERROR${c_reset}" "${c_red}$1${c_reset}"; }
info() { logger "${c_green}${c_bold}INFO${c_reset}" "${c_green}$1${c_reset}"; }
mute_stdout() { "$@" >> /dev/null; }
mute() { "$@" >> /dev/null 2>&1; }
is_unix=$(uname -s | grep -q '^Linux' && echo true || echo false)
has_bc=$(mute command -v bc)
get_time() {
	if $has_bc && $is_unix; then
		date -u +%s.%N
	else
		date -u +%s
	fi
}
elapsed_time() {
	start_time="$1"
	end_time="$2"
	if $has_bc; then
		echo "$end_time-$start_time" | bc
	else
		echo "$((end_time - start_time))"
	fi
}

# Test if a command exist
test_command() {
  command "$@" >/dev/null 2>&1
}

# Colored strace
