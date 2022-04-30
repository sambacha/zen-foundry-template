# For repeatability, reset the environment to a known state.
# TERM is sanitized below, after saving color control sequences.
LANG=C
LC_ALL=C
PAGER="cat"
TZ=UTC
EDITOR=:
export LANG LC_ALL PAGER TZ EDITOR
unset VISUAL CDPATH GREP_OPTIONS

[ "x$TERM" != "xdumb" ] && (
		[ -t 1 ] &&
		tput bold >/dev/null 2>&1 &&
		tput setaf 1 >/dev/null 2>&1 &&
		tput sgr0 >/dev/null 2>&1
	) &&
	color=t

while test "$#" -ne 0; do
	case "$1" in
