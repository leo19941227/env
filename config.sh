set bell-style none
export EDITOR=vim
set -o emacs

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gitlog='git log --oneline --all --graph'
alias gitfetch='git fetch --prune --all --tags'
alias gits='git status'
alias bashrc='vim ~/env/bashrc'
alias vimrc='vim ~/env/vimrc'
alias tmuxconf='vim ~/env/tmux.conf'

for script in $(ls ~/env/utils); do
    name=$(echo $script | cut -d . -f 1)
    alias $name='source ~/env/utils/'$name'.sh'
done

