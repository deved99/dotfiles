function ps1() {
        # Vars
        local bold="\[\e[1m\]"
        local black="\[\e[30m\]"
        local red="\[\e[31m\]"
        local green="\[\e[32m\]"
        local yellow="\[\e[33m\]"
        local blue="\[\e[34m\]"
        local magenta="\[\e[35m\]"
        local cyan="\[\e[36m\]"
        local reset="\[\e[m\]"
        # Prompt
        echo -n "$green┌── "
        echo -n "$magenta\u$reset"
        echo -n " at $blue\h$reset"
        echo " in $bold\w$reset"
        echo -n "$green└─\$ $reset"
}

PROMPT_DIRTRIM=2
PS1=$(ps1)
unset ps1
