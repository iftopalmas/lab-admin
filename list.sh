#/bin/bash

#List of files and directories to be keep when cleaning up a user home folder
file_keep_list=("Área de Trabalho" "Documentos" "Downloads" "Modelos" "Música" "Público" "snap" "Vídeos" "VirtualBox VMs")

for file in ~/*; do
    found=0
    for keep in "${file_keep_list[@]}"
    do
        basename=`basename -z "$file"`
        #echo "file: $file keep: $keep"
        if [[ "$basename" == "$keep" ]]; then
           found=1
           break
        fi
    done

    if [[ $found -eq 1 ]]; then
       echo "$file";
    fi
done