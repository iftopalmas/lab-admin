#!/bin/bash

if [[ "$#" -ne 2 || ($1 == "/h" || $1 == "-h") ]] ; then
  echo "Sends files or directories to all computers defined in the ips.txt file"
  echo ""
  echo "Usage: $0 SourceFileOrDirectory DestinationPathOnRemotePC [remote_user]" >&2
  exit 1
fi

echo -e "Type $0 -h for help\n"

remote_user="rtlapo"
if [[ "$#" -eq 3 ]] ; then
  remote_user="$3"
fi

for ip in `cat ips.txt`; do 
     scp "$1" "$remote_user@$ip":"$2"
done
