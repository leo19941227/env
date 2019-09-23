#!/bin/bash

export EDITOR=vim

# VARIABLES
export linux1='r08944041@linux1.csie.ntu.edu.tw'
export linux2='r08944041@linux2.csie.ntu.edu.tw'
export linux3='r08944041@linux3.csie.ntu.edu.tw'
export linux4='r08944041@linux4.csie.ntu.edu.tw'
export linux5='r08944041@linux5.csie.ntu.edu.tw'
export speech='leo1994122701@140.112.21.35'
export lab='leo@140.112.21.12'

# ALIAS
alias speech='ssh $speech'
alias lab='ssh $lab'
alias nlog='bash ~/env/open_newest_log.sh'
alias gitlog='git log --oneline --all --graph'
alias battleship='sshfs -p 3122 $speech:/groups/leo1994122701'

# ACTIVATE VENVS OF VIRTUALENV
[ -d ~/venvs/ ] && for venv in $(ls ~/venvs); do
    alias $venv='source ~/venvs/'$venv'/bin/activate'
done

# OPEN VIMRC and TMUX.CONF
alias vimrc='vim ~/env/vimrc'
alias tmuxconf='vim ~/env/tmux.conf'

# ALIAS DANGEROUS OPERATIONS
alias init='bash ~/env/dangerous.sh'

