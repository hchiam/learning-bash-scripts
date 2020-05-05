# grep -oe 'function [^(][^(]*(' script.js

scriptName='script.js'
scriptText=`cat ${scriptName}`
functionNames=()

global_rematch() { 
    local s=$1 regex=$2 
    while [[ $s =~ $regex ]]; do 
        # echo "${BASH_REMATCH[1]}"
        functionNames+=("${BASH_REMATCH[1]}")
        s=${s#*"${BASH_REMATCH[1]}"}
    done
}

regex='function\ ([^(][^(]*)\('
global_rematch "$scriptText" "$regex"

# printf '%s\n' "${functionNames[@]}" # print all

# replace array with unique values:
functionNames=($(echo "${functionNames[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

printf '%s\n' "${functionNames[@]}" # print all
