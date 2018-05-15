#!/bin/bash

if [[ $1 == "/h" || $1 == "-h" ]] ; then
  echo "Removes the files inside the directories defined in the clean.txt file."
  echo "Each line in such a file represents a directory to be cleaned, "
  echo "according to a file mask such as *.txt"
  echo ""
  echo "Usage: $0 [options]"
  echo -e "\t-n: start cleaning without prompt"
  exit 0
fi

echo -e "Type $0 -h for help\n"
confirm=1
if [[ $1 == "-n" ]] ; then
    confirm=0
fi

if [[ $confirm -eq 1 ]]; then
    echo "Press enter to start cleaning up directories defined in clean.txt. Press CTRL+C to stop"
    read
fi
echo "Cleaning up directories..."

while read -r line; do
   rm -rf "$line"
done < <(cat clean.txt | grep -v "#")