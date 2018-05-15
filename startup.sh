#!/bin/bash

if [[ $1 == "/h" || $1 == "-h" ]] ; then
  echo "Uses the wakeonlan to turn on all machines that mac addresses are defined in the macs.txt file"
  echo ""
  echo "Usage: $0"
  exit 0
fi

echo -e "Type $0 -h for help\n"

wakeonlan -v 2>/dev/null || (echo "wakeonlan is not installed" >&2 && exit -1)

for mac in `cat macs.txt`; do 
    wakeonlan $mac
done