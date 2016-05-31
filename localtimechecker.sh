#!/bin/sh
# version 0.1
# localtime check shell script, suitable for calling from cron

lt=/etc/localtime

# is it a symlink?

if [ -L $lt ]; then
    echo $lt "is a symlink"
else
    echo $lt "is not a symlink"
fi

# is it a valid file?

if [ -L $lt ]; then
    echo $lt "is a valid file"
else
    echo $lt "is not a valid file"
fi
