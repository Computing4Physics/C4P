#!/bin/sh
#############################
#
# Automatically clone repositories
# for students from information
# stored in the <USERLIST> file.
# 
# See the example file student-info.txt
# for format.
#
#############################

if [ $# -ne 1 ]; then
    echo "Usage: cloneRepos.sh <USERLIST>"
    exit 0
fi

userlist=$1

cat $userlist |
while IFS=$'\t' read -r -a myArray; do
   SECTION=${myArray[0]}
   LAST=${myArray[1]}
   FIRST=${myArray[2]}
   EMAIL=${myArray[3]}
   USERNAME=${myArray[4]}
   REPO=${myArray[5]}
   MAJOR=${myArray[6]}
   CLASS=${myArray[7]}
   echo user: $USERNAME   repo: $REPO
   mkdir -p Students/$USERNAME
   cd Students/$USERNAME
   rm -rf ${REPO}
   git clone https://github.com/${USERNAME}/${REPO}.git
   cd -
done

#
# All content is under a modified MIT License, 
# and can be freely used and adapted.  
# See the full license text in LICENSE.
#