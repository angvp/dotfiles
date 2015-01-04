local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'

#PROMPT="${user_host}:${current_dir} ${rvm_ruby}
#${git_branch} %B$%b "
#RPS1="${return_code}"


setprompt () {
        # load some modules
        autoload -U zsh/terminfo # Used in the colour alias below
        # Use colorized output, necessary for prompts and completions.
        autoload -U colors && colors
        setopt prompt_subst
        # make some aliases for the colours: (coud use normal escap.seq's too)
        for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
                eval PR_$color='%{$fg[${(L)color}]%}'
        done
        PR_NO_COLOR="%{$terminfo[sgr0]%}"

        # Check the UID
            if [[ $UID -ge 500 ]]; then # normal user
                eval PR_USER='${PR_BLUE}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_GREEN}%#'
        elif [[ $UID -eq 0 ]]; then # root
                eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
        fi      

        # Check if we are on SSH or not  --{FIXME}--  always goes to |no SSH|
        if [[ -z "$SSH_CLIENT"  ||  -z "$SSH2_CLIENT" ]]; then 
                eval PR_HOST='${PR_BLUE}%M${PR_NO_COLOR}' # no SSH
        else 
                eval PR_HOST='${PR_BLUE}%M${PR_NO_COLOR}' #SSH
        fi
        if [[ -f /inchroot ]]; then
                eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
        fi
        # set the prompt
        PROMPT=$'${PR_CYAN}[${PR_USER}${PR_YELLOW}@${PR_HOST}${PR_CYAN}][${PR_MAGENTA}%~${PR_CYAN}]${PR_USER_OP}${PR_NO_COLOR} '
        RPROMPT=$'${PR_GREEN}$(git_prompt_info)${PR_NO_COLOR}'
}
setprompt

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
