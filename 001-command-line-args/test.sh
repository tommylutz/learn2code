#!/usr/bin/env bash
SCRIPTDIR=$(cd -P $(dirname $(command -v $0)) && pwd -P)

echo "----------------------------------------------------"
echo "Write a script caled 001.py, in this folder, that "
echo "accepts a single command line argument, and echoes out "
echo "\"Argument: \", followed by the argument passed in."
echo "Example invocation and output:"
echo "  dev@devbox:~/$ ./001.py foobar"
echo "  Argument: foobar"
echo "  dev@devbox:~/$"
echo ""
echo "Hit ENTER to test your program, or Ctr+C to exit"
read ARG

if [ ! -f "$SCRIPTDIR/001.py" ]; then
    echo "ERROR: Your script, 001.py, does not exist"
    exit 1
fi

if [ ! -x "$SCRIPTDIR/001.py" ]; then
    echo "I'm not sure your script, 001.py, is executable. Please check"
    exit 1
fi

PASS=1

for ARG in foo bar bat baz crazy wonkey 123456; do
    echo "...Running your program as: $SCRIPTDIR/001.py $ARG"
    OUTPUT=$($SCRIPTDIR/001.py $ARG)
    if [ "$OUTPUT" = "Argument: $ARG" ]; then
        echo "PASS: Your program accepted an argument and echoed out [$OUTPUT]"
    else
        echo "FAIL: Your program did not echo out [Argument: $ARG]. It emitted [$OUTPUT]"
        PASS=0
    fi
done

if [ $PASS -gt 0 ]; then
    echo "==========YOU PASSED========="
else
    echo "=========YOUR CODE FAILED======="
fi


