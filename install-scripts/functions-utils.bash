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
strace_color() {
  LC_ALL=C strace -f -yy "$@" 2>&1 | 
    perl -pe "s/([A-Z_]{3,})/${c_yellow}\1${c_reset}/g" |
    perl -pe "s/(strace:.*?)([0-9]+)(.*?attached)/${c_black}\1${c_purple}\2${c_black}\3${c_reset}/g" |
    perl -pe "s/(\".*?\")/${c_green}\1${c_reset}/g" |
    perl -pe "s/(?<syscode>[a-z0-9_]*?)(?<params>\(.*(\)|>))/${c_red}$+{syscode}${c_reset}$+{params}/g" |
    perl -pe "s/NULL/${c_cyan}NULL${c_reset}/g" |
    perl -pe "s/(\/\*.*?\*\/)/${c_purple}\1${c_reset}/g" |
    perl -pe "s/(?<addr>0x[0-9a-z]*)/${c_cyan}$+{addr}${c_reset}/g" |
    perl -pe "s/([a-z_]+)=/${c_blue}\1${c_reset}=/g" |
    perl -pe "s/\+{3}(.*?)\+{3}/${c_black}+++${c_purple}\1${c_black}+++${c_reset}/g" |
    perl -pe "s/<\.\.\. ([a-z0-9_]+) resumed>/${c_black}<... ${c_red}\1 ${c_black}resumed>${c_reset}/g" |
    perl -pe "s/<unfinished \.\.\.>/${c_black}<unfinished ...>${c_reset}/g" |
    perl -pe "s/^\[pid ([0-9]+)\]/${c_black}[pid ${c_purple}\1${c_black}]${c_reset}/g"
}; export strace_color
