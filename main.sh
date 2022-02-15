#!/usr/bin/env bash

OK=0
E_ARGS=1
E_INVALID=2
E_NOTEXIST=3
E_EXISTS=4


for ((I=1; I <= $# ; I++)); do
    if [[ "$HIDE" != $I ]]; then
        ARGUMENTS="$ARGUMENTS '$(eval echo \$${I})'"
    else
        ARGUMENTS="$ARGUMENTS '******'"
    fi
done


# Cek Result
check_result() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2"
        if [ ! -z "$3" ]; then
            exit $3
        else
            exit $1
        fi
    fi
}

# Cek Argument
check_args() {
    if [ "$1" -gt "$2" ]; then
        echo "Usage: $(basename $0) $3"
        check_result $E_ARGS "not enought arguments" >/dev/null
    fi
}
