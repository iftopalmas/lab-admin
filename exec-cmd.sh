#!/bin/bash

if [[ "$#" -ne 1 || ($1 == "/h" || $1 == "-h") ]] ; then
  echo "Executes a command on all remote computers defined in the ips.txt file"
  echo ""
  echo "Usage: $0 CommandToExecuteOnRemotePC [remote_user]" >&2
  exit 1
fi

remote_user="rtlapo"
if [[ "$#" -eq 2 ]] ; then
  remote_user="$2"
fi

for ip in `cat ips.txt`; do 
    ssh "$remote_user@$ip" "$1"
done