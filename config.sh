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

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
alias pyenv_init='eval "$(pyenv init -)"'

# Amazon
alias s3_data_us_east_1="s3://novaboard-shared-apt-agi-3p-data-us-east-1"
alias s3_data_eu_west_1="s3://novaboard-shared-apt-agi-3p-data-mirror-eu-west-1"
export PYTHONPATH=/efs/ec2-user/codebase/APTA2ADataLoading/src:$PYTHONPATH
export PYTHONPATH=/efs/ec2-user/codebase/APTUtils/src:$PYTHONPATH
export PYTHONPATH=/efs/ec2-user/codebase/torch-fidelity:$PYTHONPATH
export PYTHONPATH=/efs/ec2-user/codebase/audioldm_eval:$PYTHONPATH
export PYTHONPATH=/efs/ec2-user/codebase/AudioLDM-training-finetuning:$PYTHONPATH
