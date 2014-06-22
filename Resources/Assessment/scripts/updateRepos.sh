#!/bin/sh
#############################
#
# Automatically update repositories
# for students from information
# stored in the <USERLIST> file.
#
# See the example file student-info.txt
# for format.
#
#############################   

if [ $# -ne 1 ]; then
    echo "Usage: updateRepo.sh <USERLIST>"
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
   echo "+++++++++++++++++++++++++++++"
   echo "first: $FIRST      last: $LAST"
   echo "email: $EMAIL  username: $USERNAME"
   echo " repo: $REPO    section: $SECTION"
   echo "+++++++++++++++++++++++++++++"
   cd Students/$USERNAME/$REPO
   git checkout -- .
   git pull origin master
   git status
   cd - >& /dev/null
done

#
# All content is under a modified MIT License,
# and can be freely used and adapted.
# See the full license text in LICENSE.
#