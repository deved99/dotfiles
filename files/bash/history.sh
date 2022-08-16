# [[file:bash.org::*History][History:1]]
# [[[[file:~/.dotfiles/files/bash/bash.org::*History][History]]][]]
HISTCONTROL=ignorespace:erasedups
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*History][History]]][]]
HISTSIZE=
HISTFILESIZE=
# ends here
# [[[[file:~/.dotfiles/files/bash/bash.org::*History][History]]][]]
function clean-bash-history() {
  echo "Old # of lines: $(wc -l ~/.bash_history | cut -f1)"
  echo "Old size of history: $(du -hs .bash_history  | cut -f1)"
  tac ~/.bash_history | awk '!seen[$0]++' | tac > /tmp/bash_history
  mv /tmp/bash_history ~/.bash_history
  echo "New # of lines: $(wc -l ~/.bash_history | cut -f1)"
  echo "New size of history: $(du -hs .bash_history  | cut -f1)"
}
# ends here
# History:1 ends here
