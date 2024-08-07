# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias bohan="ssh bohan@140.112.21.9 -p 531"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# no bell
set bell-style none
export EDITOR=vim

# VARIABLES
export linux1='r08944041@linux1.csie.ntu.edu.tw'
export linux2='r08944041@linux2.csie.ntu.edu.tw'
export linux3='r08944041@linux3.csie.ntu.edu.tw'
export linux4='r08944041@linux4.csie.ntu.edu.tw'
export linux5='r08944041@linux5.csie.ntu.edu.tw'
export battleship='leo1994122701@140.112.21.35'
export lab='leo@140.112.21.12'
export superb='superb@140.112.21.28'
export special_ta_test='ta_test@140.112.21.80'
export twcc='leo19941227@xdata1.twcc.ai'

# ALIAS
alias battleship='ssh $speech'
alias lab='ssh $lab'
alias superb='ssh $superb'
alias chang="ssh changlee@140.109.21.227"
alias special_ta='ssh roylu@140.112.21.35 -p 2822'
alias gitlog='git log --oneline --all --graph'
alias gitfetch='git fetch --prune --all --tags'
alias gitpullrequest='git fetch origin pull/$id/head:$branch'
alias battleship='sshfs -p 3122 $speech:/groups/leo1994122701'
alias demo='ssh roylu@140.112.21.35 -p 2822'

# ALIAS SCRIPTS
for script in $(ls ~/env/utils); do
    name=$(echo $script | cut -d . -f 1)
    alias $name='source ~/env/utils/'$name'.sh'
done

# ACTIVATE VENVS OF VIRTUALENV
[ -d ~/venvs/ ] && for venv in $(ls ~/venvs); do
    alias $venv='source ~/venvs/'$venv'/bin/activate'
done

# OPEN VIMRC and TMUX.CONF
alias gits='git status'
alias bashrc='vim ~/env/bashrc'
alias vimrc='vim ~/env/vimrc'
alias tmuxconf='vim ~/env/tmux.conf'

# ALIAS DANGEROUS OPERATIONS
alias init='bash ~/env/utils/dangerous.sh'

# PLATFORM DEPENDENT REGION
if [ "$(hostname)" == "speechlab" ] && [ "$(whoami)" == "leo" ]; then
    export work='/home/leo/d/'
    export group='/home/leo/groups/leo1994122701/'
    export twcc_sftp='leo19941227@xdata1.twcc.ai'
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export PATH="/usr/local/cuda/bin:$PATH"
    export KENLM_ROOT='/home/leo/d/tools/kenlm'
    export CONDA_ROOT="/home/leo/miniconda3"

    export KALDI_ROOT=/home/leo/d/tools/kaldi
    PATH=$PATH:$KALDI_ROOT/tools/openfst
    PATH=$PATH:$KALDI_ROOT/src/featbin
    PATH=$PATH:$KALDI_ROOT/src/gmmbin
    PATH=$PATH:$KALDI_ROOT/src/bin
    PATH=$PATH:$KALDI_ROOT/src/nnetbin
    PATH=$PATH:$KALDI_ROOT/src/ivectorbin
    PATH=$PATH:/home/leo/d/tools/SCTK/bin

elif [ "$(hostname)" == "speechlab" ] && [ "$(whoami)" == "decathlon" ]; then
    CONDA_ROOT="/home/decathlon/miniconda3/"

elif [ "$(hostname)" == "login.speech" ]; then
    export work='/groups/leo1994122701/'
    export public='/groups/public/'
    export KALDI_ROOT=/opt/kaldi
    export CONDA_ROOT=""

elif [ "$(cat /etc/os-release | head -n 1)" == "NAME=\"Ubuntu\"" ]; then
    export work="/work/leo19941227"
    export CONDA_ROOT="/home/leo19941227/miniconda3"

fi

if [ ! -z "$CONDA_ROOT" ]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$($CONDA_ROOT'/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f $CONDA_ROOT"/etc/profile.d/conda.sh" ]; then
            . $CONDA_ROOT"/etc/profile.d/conda.sh"
        else
            export PATH=$CONDA_ROOT"/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    conda deactivate
fi

if shopt -q login_shell; then 
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    command -v pyenv >/dev/null && eval "$(pyenv init -)"
fi

export PATH=/usr/local/go/bin:$PATH
