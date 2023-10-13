# [[file:bash.org::*Aliases][Aliases:1]]
# [[[[file:~/.dotfiles/files/bash/bash.org::aliases/colors][aliases/colors]]][aliases/colors]]
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip -c'
alias fd='fdfind'
# aliases/colors ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::aliases/ls][aliases/ls]]][aliases/ls]]
EXA_DEFAULT="exa --group-directories-first"
alias ll="$EXA_DEFAULT -l"
alias la="$EXA_DEFAULT -al"
alias lt="$EXA_DEFAULT -T --git-ignore"
alias lta="$EXA_DEFAULT -T"
# aliases/ls ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::aliases/emacs][aliases/emacs]]][aliases/emacs]]
alias ef='neovide --multigrid'
# aliases/emacs ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*Aliases][Aliases]]][]]
alias usystemctl='systemctl --user'
alias ujournalctl='journalctl --user'
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*Aliases][Aliases]]][]]
alias gclip='xclip -o | gpg -d'
alias jclip='xclip -o | jq'
alias yclip='xclip -o | yq'
alias shclip='xclip -o -selection clipboard | bash'
alias wclip='whois $(xclip -o)'
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*Aliases][Aliases]]][]]
alias ssh='TERM=xterm-256color ssh'
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*Aliases][Aliases]]][]]
function cj() {
  curl --silent $@ | jq
}
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*Aliases][Aliases]]][]]
alias yapf="yapf --style={based_on_style:google\,indent_width:2}"
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*Aliases][Aliases]]][]]
alias myip='curl ifconfig.co'
# ends here
# Aliases:1 ends here

alias python='ipython3'

function k8s-secret() {
    kubectl get secret -o json $@ \
        | jq '.data | with_entries({ key, "value": .value | @base64d})'
}
