HISTCONTROL=ignorespace:erasedups
HISTSIZE=
HISTFILESIZE=
function clean-bash-history() {
  echo "Old # of lines: $(wc -l ~/.bash_history | cut -f1)"
  echo "Old size of history: $(du -hs .bash_history  | cut -f1)"
  tac ~/.bash_history | awk '!seen[$0]++' | tac > /tmp/bash_history
  mv /tmp/bash_history ~/.bash_history
  echo "New # of lines: $(wc -l ~/.bash_history | cut -f1)"
  echo "New size of history: $(du -hs .bash_history  | cut -f1)"
}
