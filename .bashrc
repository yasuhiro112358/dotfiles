# *Prompt Setting*
# export PS1='\u@\h:\w\$ '
# export PS1='\[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\$ '
export PS1='\[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\] \[\e[35m\]\d \t\[\e[m\]\$ '


# Add Laravel Sail alias
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'