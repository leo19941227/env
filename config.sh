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

# platform-dependent settings
if hostname | grep -q "speechlab"; then
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export KENLM_ROOT="/home/leo/d/tools/kenlm"
    export KALDI_ROOT="/home/leo/d/tools/kaldi"
    export PATH=$PATH:"/usr/local/cuda/bin"
    export PATH=$PATH:$KALDI_ROOT/tools/openfst
    export PATH=$PATH:$KALDI_ROOT/src/featbin
    export PATH=$PATH:$KALDI_ROOT/src/gmmbin
    export PATH=$PATH:$KALDI_ROOT/src/bin
    export PATH=$PATH:$KALDI_ROOT/src/nnetbin
    export PATH=$PATH:$KALDI_ROOT/src/ivectorbin
    export PATH=$PATH:/home/leo/d/tools/SCTK/bin

elif hostname | grep -q "login.speech"; then
    export work='/groups/leo1994122701/'
    export public='/groups/public/'
    export KALDI_ROOT=/opt/kaldi

elif cat /etc/os-release | grep -q "Amazon Linux"; then
    alias mlpprep='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess prepare_datamart_data.py --content-types AUDIO -- '
    alias mlpcat='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess get_datamart_data.py --content-type AUDIO --data-type data -- '
    alias curlhost='curl -s https://host-discovery.hoverboard | python -m json.tool'
    alias xsub="/apollo/bin/env -e HoverboardVolumeSnapshot-AEDevSnapshot python"
    alias awss3="AWS_CREDENTIALS_ODIN=AWS_CREDENTIALS_ODIN s3"
    alias hovers3cat="/apollo/env/HoverboardFileAccessPythonScripts/bin/hovers3cat -c $S3_CREDENTIAL"
    alias hovers3put="/apollo/env/HoverboardFileAccessPythonScripts/bin/hovers3put -c $S3_CREDENTIAL"
    alias s3putpy="/apollo/env/BlueshiftModelingTools/bin/s3put.py -c $S3_CREDENTIAL"
    alias s3head="AWS_CREDENTIALS_ODIN=$AWS_CREDENTIALS_ODIN s3api head-object"
    alias s3list="/apollo/env/BlueshiftModelingTools/bin/s3list.rb -c $S3_CREDENTIAL"
    alias mlpprep='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess prepare_datamart_data.py --content-types AUDIO -- '                                                  # mlpprep $dmid
    alias mlpstatus='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess get_job_status.py'                                                                                 # $jobid
    alias mlpcat='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess get_datamart_data.py --content-type AUDIO --data-type data -- '                                       # mlpcat $dmid > ff.wav
    alias mlpcatmetadata='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess get_datamart_data.py --content-type AUDIO --data-type metadata -- '                           # mlpcat $dmid > ff.wav
    alias mlpprepSegmentedPresenceDetection='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess prepare_datamart_data.py --content-types SEGMENTED_PRESENCE_DETECTION -- ' # mlpprep $dmid alias mlpcatSegmentedPresenceDetection='/apollo/bin/env -e HoverboardVolumeSnapshot-MLPDataAccess get_datamart_data.py --content-type SEGMENTED_PRESENCE_DETECTION --data-type data -- ' #     mlpcat $dmid > ff.wav                                                                                                                                                                        alias curlhost='curl -s https://host-discovery.hoverboard | python -m json.tool'
    alias mlps3='/apollo/env/HoverboardDefaultMLPS3Tool/bin/mlps3'
    alias scaleup='/apollo/env/HoverboardScaleCLI/bin/scale'
    alias terminate-worker='/apollo/env/HoverboardScaleCLI/bin/hover-scale terminate-worker'
    # alias getip="/usr/bin/curl -s https://host-discovery.hoverboard  | jq -c '.[] | {privateIpAddress: .privateIpAddress, instanceId: .instanceId, tagName: .tags.Name, instanceType: .instanceType, state: .state.name}'"
    alias getip="/usr/bin/curl -s https://host-discovery.hoverboard  | jq -c '.[] | {ip: .privateIpAddress, type: .instanceType, state: .state.name}'"
    alias sshgpu='ssh -i ~/.ssh/worker_key -o UserKnownHostsFile=~/.ssh/worker_hosts'
    alias termgpu='/apollo/env/HoverboardScaleCLI/bin/hover-scale terminate-worker --ip'
    alias term='terminate-worker --ip $(ip a | grep 10.0. | cut -d/ -f1 | cut -d " " -f6)'

    export s3_data_us_east_1="s3://novaboard-shared-apt-agi-3p-data-us-east-1"
    export s3_data_eu_west_1="s3://novaboard-shared-apt-agi-3p-data-mirror-eu-west-1"
    export NUMEXPR_MAX_THREADS=32
    export s3="/apollo/env/HoverboardAshS4/var/s3_mounts"
    export TORCH_HOME=/efs/ec2-user/cache/torch

    export PYTHONPATH=/efs/ec2-user/codebase/APTA2ADataLoading/src:$PYTHONPATH
    export PYTHONPATH=/efs/ec2-user/codebase/APTUtils/src:$PYTHONPATH
    export PYTHONPATH=/efs/ec2-user/codebase/torch-fidelity:$PYTHONPATH
    export PYTHONPATH=/efs/ec2-user/codebase/audioldm_eval:$PYTHONPATH
    export PYTHONPATH=/efs/ec2-user/codebase/AudioLDM-training-finetuning:$PYTHONPATH
    export PYTHONPATH=/efs/ec2-user/codebase/mar:$PYTHONPATH
    export PYTHONPATH=/efs/ec2-user/codebase/:$PYTHONPATH

    CONDA_ROOT=/home/ec2-user/anaconda3  # must not use export
fi

# conda env
if [ ! -z "$CONDA_ROOT" ]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$($CONDA_ROOT'/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
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
fi

# pyenv env
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
alias pyenv_init='eval "$(pyenv init -)"'
