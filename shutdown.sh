#!/bin/bash

if [[ "$#" -ne 1 || ($1 == "/h" || $1 == "-h") ]] ; then
  echo "Shuts down all remote computers defined in the ips.txt file"
  echo ""
  echo "Usage: $0 [remote_user]" >&2
  exit 1
fi

./execute.sh 'shutdown -h now'