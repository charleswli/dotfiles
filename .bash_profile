function parse_git_branch() {
    x=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
    if [[ "$x" == "" ]]; then
    echo "(no git) "
    else
    echo "$x "
    fi
}
export PROMPT_COMMAND='export OLD_STATUS=$?'
export PS1='\n\[\033[1;32m\]\u@\[\033[1;32m\]\h \[\033[1;37m\]\d \[\033[1;37m\]\t \[\033[1;34m\]`parse_git_branch`\[\033[1;32m\]`if [ $OLD_STATUS = 0 ]; then echo \☀; else echo \☁; fi` \n\[\033[1;34m\]\w \[\033[1;37m\]\$ \[\033[0m\]'

function settitle() { echo -n -e "\033]0;$@\007"; }
function cd() { command cd "$@"; settitle `pwd -P`; }
settitle `pwd`
