alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alhF'
alias la='ls -A'
alias ew='emacsclient -c'
alias ef='emacsclient -c --no-wait'
alias ssh='TERM=xterm-256color ssh'
alias jclip='xclip -o | jq'
alias yapf="yapf --style={based_on_style:google\,indent_width:2}"
function mkcd() {
  mkdir $1
  cd $1
}
