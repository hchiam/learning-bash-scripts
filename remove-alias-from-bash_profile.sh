# if for example you had this deleted but it still responds in the CLI: alias someCustomAliasThatExists='echo hi'
# then put this in .bash_profile:
unalias someCustomAliasThatExists
# and then run this in CLI: source ~/.bash_profile

# warning: do NOT have unalias in .bash_profile for an alias that doesn't exist (you might get a weird error when you do source ~/.bash_profile)
