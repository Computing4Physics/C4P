#!/bin/bash
#############################
#
# Extract grade totals from
# student assessment files
# and print to screen.
#
#############################   

if [ $# -ne 1 ]; then
    echo "Usage: printGrades.sh <ASSIGNMENT>"
    exit 0
fi

ASSIGNMENT=$1

echo "##########"
cat user_list.txt |
while IFS=$'\t' read -r -a myArray; do
   SECTION=${myArray[0]}
   LAST=${myArray[1]}
   FIRST=${myArray[2]}
   EMAIL=${myArray[3]}
   USERNAME=${myArray[4]}
   REPO=${myArray[5]}
   MAJOR=${myArray[6]}
   CLASS=${myArray[7]}
   PROJECT=${myArray[8]}
   cd Students/$USERNAME
   echo "### |" $ASSIGNMENT "|" $LAST","$FIRST" |" `fgrep "Total:" ${LAST}_${ASSIGNMENT}.txt`
   echo "##########"
   cd - >& /dev/null
done

#
# All content is under a modified MIT License,
# and can be freely used and adapted.
# See the full license text in LICENSE.
#   