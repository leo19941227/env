# DEFINE ENV START
# installing script moves codes between START and END into ~/.bashrc
# uninstalling script removes all codes between START and END in ~/.bashrc

# VARIABLES
linux1='b03902130@linux1.csie.ntu.edu.tw'
linux2='b03902130@linux2.csie.ntu.edu.tw'
linux3='b03902130@linux3.csie.ntu.edu.tw'
linux4='b03902130@linux4.csie.ntu.edu.tw'
linux5='b03902130@linux5.csie.ntu.edu.tw'
speech='leo1994122701@sppco.ee.ntu.edu.tw'
mint='leo@192.168.56.101'
github='https://github.com/b03902130/'

# ALIAS
alias home='ssh -t $linux5 "ssh leo@localhost -p 1994"'
alias mint='ssh $mint'
alias speech='ssh $speech'

# DEFINE ENV END
