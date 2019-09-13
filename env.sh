# VARIABLES
linux1='r08944041@linux1.csie.ntu.edu.tw'
linux2='r08944041@linux2.csie.ntu.edu.tw'
linux3='r08944041@linux3.csie.ntu.edu.tw'
linux4='r08944041@linux4.csie.ntu.edu.tw'
linux5='r08944041@linux5.csie.ntu.edu.tw'
speech='leo1994122701@140.112.21.35'
lab='leo@140.112.21.12'
github='https://github.com/b03902130/'

# ALIAS
alias speech='ssh $speech'
alias lab='ssh $lab'

# VENVS
for venv in $(ls ~/venvs); do
    alias $venv='source ~/venvs/'$venv'/bin/activate'
done

