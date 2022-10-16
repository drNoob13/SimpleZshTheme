#
# Tuan Zsh Theme a.k.a SimpleZshTheme
# Landing page: https://github.com/drNoob13/SimpleZshTheme
# How to use: refer README.md

#----------------------------------------
#   P L U G I N S
#----------------------------------------
# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}\UE0A0 ${reset_color}%{$fg[magenta]%}(" # 
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset_color} "
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$fg[red]%} 🔥 "
ZSH_THEME_GIT_PROMPT_CLEAN=")%{$fg[green]%} "

# Mimic virtualenv configs
VENV_PREFIX="via "
VENV_SUFFIX="  "

#----------------------------------------
#  S U B - F U N C T I O N S
#----------------------------------------
# Virtual env 
function getVenvInfo() {
    [[ -n ${VIRTUAL_ENV} ]] || return
    local color="%{$fg_no_bold[yellow]%}"
    echo "${color}${VENV_PREFIX}\UE235${VENV_SUFFIX}${reset_color} "
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Directory prompt (2 levels)
function getDirectory() {
    # local path="%{$fg_bold[cyan]%}%2~" # '%2~' means 2 levels (current+parent) and if curr = $HOME, display '~'
    local path="%{$fg[cyan]%}%2~" # '%2~' means 2 levels (current+parent) and if curr = $HOME, display '~'
    echo "${path}${reset_color}  "
}

# Time
function getCurrentTime() {
    local color="%{$fg_no_bold[cyan]%}";
    local time='(%t)'; # %t is AM/PM format
    echo "${color}${time}${reset_color}";
}

# Command status (shamelessly steal the arrow icon from ChesterYue's ohmyzsh-theme-passion)
function getArrowPromptWithStatus() {
    local font_reset="%{$fg_no_bold[white]%}"
    local arrow_exec_success="%{$fg_bold[yellow]%}❱%{$fg_bold[green]%}❱"
    local arrow_exec_fail="%{$fg_bold[red]%}❱❱"
    local arrow=%(?:${arrow_exec_success}:${arrow_exec_fail})
    echo "${arrow}${font_reset}${reset_color}"
}

#----------------------------------------
#   M A I N
#----------------------------------------

# Colors := Red, Blue, Green, Cyan, Yellow, Magenta, Black & White

PROMPT=$'\n $(getDirectory)$(git_prompt_info)$(getVenvInfo)$(getCurrentTime)'
PROMPT+=$'\n $(getArrowPromptWithStatus) '
