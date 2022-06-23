# [[file:snippets.org::*Aliases][Aliases:1]]
# [[[[file:~/.dotfiles/files/bash/snippets.org::aliases/colors][aliases/colors]]][aliases/colors]]
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# aliases/colors ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::aliases/ls][aliases/ls]]][aliases/ls]]
alias ll='ls -alhF'
alias la='ls -A'
# aliases/ls ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::aliases/emacs][aliases/emacs]]][aliases/emacs]]
alias ew='emacsclient -c'
alias ef='emacsclient -c --no-wait'
# aliases/emacs ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::*Aliases][Aliases]]][]]
alias ssh='TERM=xterm-256color ssh'
# ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::*Aliases][Aliases]]][]]
alias shclip='xclip -o -selection clipboard | bash'
alias jclip='xclip -o | jq'
alias wclip='whois $(xclip -o)'
# ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::*Aliases][Aliases]]][]]
alias yapf="yapf --style={based_on_style:google\,indent_width:2}"
# ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::*Aliases][Aliases]]][]]
function mkcd() {
  mkdir $1
  cd $1
}
# ends here
# [[[[file:~/.dotfiles/files/bash/snippets.org::*Aliases][Aliases]]][]]
alias myip='printf "$(curl -s ifconfig.me || echo Network unavailable)\n"'
# ends here
# Aliases:1 ends here
