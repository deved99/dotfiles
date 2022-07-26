# [[file:init.org::*Summary 🗂️][Summary 🗂️:3]]
# [[[[file:~/.dotfiles/files/emacs/init.org::vterm/bash-index][vterm/bash-index]]][vterm/bash-index]]
# [[[[file:~/.dotfiles/files/emacs/init.org::vterm/bash-index][vterm/bash-index]]][]]
vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
# ends here
# [[[[file:~/.dotfiles/files/emacs/init.org::vterm/bash-index][vterm/bash-index]]][]]
vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'
# ends here
# vterm/bash-index ends here
# Summary 🗂️:3 ends here
