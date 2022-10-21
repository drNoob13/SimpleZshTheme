#
# Tuan Zsh Theme a.k.a SimpleZshTheme
# Landing page: https://github.com/drNoob13/SimpleZshTheme
# How to use: refer README.md
# asdfsdf

# Global
color_reset="%{$reset_color%}";
color_minor="%F{245}"

#----------------------------------------
#   P L U G I N S
#----------------------------------------
# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%F{248} ${color_reset}%F{176}" #  \UE0A0      
ZSH_THEME_GIT_PROMPT_SUFFIX="${color_reset} "
ZSH_THEME_GIT_PROMPT_DIRTY=" 🔥 "
ZSH_THEME_GIT_PROMPT_CLEAN=" "

# Mimic virtualenv configs
VENV_PREFIX="via "
VENV_SUFFIX=" "

#----------------------------------------
#  S U B - F U N C T I O N S
#----------------------------------------
  
# Virtual env  (\UE235) 
function getVenvInfo() {
    [[ -n ${VIRTUAL_ENV} ]] || return
    local color="%F{229}"
    echo "${color_minor}${VENV_PREFIX}${color} ${VENV_SUFFIX}${color_reset}"
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Directory prompt (2 levels)
function getDirectory() {
    # '%2~' means 2 levels (current+parent)
    local path="%F{cyan}%2~"
    echo "${path}${color_reset} "
}

# Time
function getCurrentTime() {
    local prefix="("
    local suffix=")"
    local color="%F{110}" # 007
    local time='%T' # %t is AM/PM format
    echo "${color_minor}${prefix}${color}${time}${color_minor}${suffix}${color_reset}"
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
# 256-color: run `spectrum_ls` on your terminal to see a list of colors and respective codes

PROMPT=$'\n $(getDirectory)$(git_prompt_info)$(getVenvInfo)$(getCurrentTime)'
PROMPT+=$'\n $(getArrowPromptWithStatus) '
