#
# Tuan's zsh theme
# Landing page: https://github.com/drNoob13/SimpleZshTheme
# How to use: refer README
# Shamelessly steal materials from robbyrussell and ChesterYue

color_reset="%{$reset_color%}"

# Virtual env 
function getVenvInfo(){
    [[ -n ${VIRTUAL_ENV} ]] || return
    local color="%{$fg_bold[yellow]%}"
    echo "${color}${ZSH_THEME_VIRTUALENV_PREFIX=[}\UE235${ZSH_THEME_VIRTUALENV_SUFFIX=]}${color_reset} "
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Directory prompt (2 levels)
function getDirectory() {
    local path="%{$fg_bold[cyan]%}%2~" # '%2~' means 2 levels (current+parent) and if curr = $HOME, display '~'
    echo "${path}${color_reset} "
}

# Time (copied from: https://github.com/ChesterYue/ohmyzsh-theme-passion/blob/master/passion.zsh-theme) 
function getCurrentTime() {
    local color="%{$fg_no_bold[cyan]%}";     # color in PROMPT need format in %{XXX%} which is not same with echo
    local time="($(date +%H:%M))";
    echo "${color}${time}${color_reset}";
}

# Command (copied from: https://github.com/ChesterYue/ohmyzsh-theme-passion/blob/master/passion.zsh-theme) 
function update_command_status() {
    local arrow="";
    local reset_font="%{$fg_no_bold[white]%}";
    COMMAND_RESULT=$1;
    export COMMAND_RESULT=$COMMAND_RESULT
    if $COMMAND_RESULT;
    then
        arrow="%{$fg_bold[yellow]%}❱%{$fg_bold[green]%}❱";
    else
        arrow="%{$fg_bold[red]%}❱❱❱";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}
update_command_status true;
function getCommandStatus() {
    echo "${COMMAND_STATUS}"
}


#----------------------------------------
#   M A I N
#----------------------------------------

# Colors := Red, Blue, Green, Cyan, Yellow, Magenta, Black & White

PROMPT=$'\n'' $(getDirectory)$(git_prompt_info)'
PROMPT+='$(getVenvInfo)'
PROMPT+='$(getCurrentTime)'
PROMPT+=$'\n'' $(getCommandStatus) '

ZSH_THEME_GIT_PROMPT_PREFIX="  %{$fg_bold[magenta]%}\UE0A0 %{$reset_color%}%{$fg[magenta]%}(" # 
ZSH_THEME_GIT_PROMPT_SUFFIX="${color_reset} "
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$fg[red]%}🔥 "
ZSH_THEME_GIT_PROMPT_CLEAN=")%{$fg[green]%}✔ "

ZSH_THEME_VIRTUALENV_PREFIX="via "
ZSH_THEME_VIRTUALENV_SUFFIX="  "