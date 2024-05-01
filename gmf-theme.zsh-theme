# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$reset_color%}%{$fg[yellow]%}on "
YS_VCS_PROMPT_PREFIX2="%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Git short sha
local git_sha='$(git_prompt_short_sha)'
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[cyan]%} "
ZSH_THEME_GIT_PROMPT_SHA_AFTER=" %{$reset_color%} "

# Virtualenv
local venv_info='$(virtenv_prompt)'
YS_THEME_VIRTUALENV_PROMPT_PREFIX=" %{$fg[green]%}"
YS_THEME_VIRTUALENV_PROMPT_SUFFIX=" %{$reset_color%}%"
virtenv_prompt() {
	[[ -n "${VIRTUAL_ENV:-}" ]] || return
	echo "${YS_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUAL_ENV:t}${YS_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}

local exit_code="%(?,,%{$fg[red]%}%?%{$reset_color%})"
local exit_color_time="%(?,%{$fg[green]%}%*%{$reset_color%},%{$fg[red]%}%*%{$reset_color%})"

# Prompt format:
#
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND
#
# For example:
#
# % ys @ ys-mbp in ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
PROMPT="
$exit_color_time \
%F{8}%n@%m%{$reset_color%} \
%{$fg[blue]%}[%~]%{$reset_color%}\
${git_info}\
${git_sha}\
${venv_info}
%{$terminfo[bold]$fg[gray]%}$ %{$reset_color%}"
