#
# Tuan Zsh Theme a.k.a SimpleZshTheme
# Landing page: https://github.com/drNoob13/SimpleZshTheme
# How to use: refer README.md
# asdfsdf

# Global
color_reset="%{$reset_color%}";

#----------------------------------------
#   P L U G I N S
#----------------------------------------
# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{magenta}\UE0A0 ${color_reset}%F{magenta}(" # 
ZSH_THEME_GIT_PROMPT_SUFFIX="${color_reset} "
ZSH_THEME_GIT_PROMPT_DIRTY=")%F{red} 🔥 "
ZSH_THEME_GIT_PROMPT_CLEAN=") "

# Mimic virtualenv configs
VENV_PREFIX="via "
VENV_SUFFIX="  "

#----------------------------------------
#  S U B - F U N C T I O N S
#----------------------------------------

# Virtual env 
function getVenvInfo() {
    [[ -n ${VIRTUAL_ENV} ]] || return
    local color="%F{yellow}"
    echo "${color}${VENV_PREFIX}\UE235${VENV_SUFFIX}${color_reset} "
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Directory prompt (2 levels)
function getDirectory() {
    local path="%F{cyan}%2~" # '%2~' means 2 levels (current+parent)
    echo "${path}${color_reset}  "
}

# Time
function getCurrentTime() {
    local prefix="at "
    local color="%F{cyan}"
    local time='%T' # %t is AM/PM format
    echo "${prefix}${color}${time}${color_reset}"
}

# (Fixed) Issue: command tab completion duplicates the prompt: 
#   https://stackoverflow.com/questions/11916064/zsh-tab-completion-duplicating-command-name
#   https://stackoverflow.com/questions/7957435/zsh-auto-complete-screws-up-command-name/10644062#10644062

# Command status (shamelessly steal the arrow icon from ChesterYue's ohmyzsh-theme-passion)
function getArrowPromptWithStatus() {
    local font_reset="%F{white}"
    local arrow_exec_success="%F{yellow}❱%F{green}❱"
    local arrow_exec_fail="%F{red}❱❱"
    local arrow=%(?:${arrow_exec_success}:${arrow_exec_fail})
    echo "${arrow}${font_reset}${color_reset}"
}

#----------------------------------------
#   M A I N
#----------------------------------------

# Colors := Red, Blue, Green, Cyan, Yellow, Magenta, Black & White

PROMPT=$'\n $(getDirectory)$(git_prompt_info)$(getVenvInfo)$(getCurrentTime)'
PROMPT+=$'\n $(getArrowPromptWithStatus) '
