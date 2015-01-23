#!/bin/bash

if [ $# -lt 2 ]
  then
    echo "You must enter two arguments filename and new filename stub"
    exit 1;
fi

FILENAME=$1
BASEFILENAME=$(basename "$1")
EXT="${BASEFILENAME##*.}"
STUB=$2
DIR=$(dirname $FILENAME)

SZ=`identify -format "%wx%h" $FILENAME`
mv $FILENAME $DIR/$STUB-$SZ.$EXT

