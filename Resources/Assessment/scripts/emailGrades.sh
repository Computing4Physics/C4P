#!/bin/sh

#############################
#
# Automatically email students
# assessment information for
# assignments.
#
# Must be run on a machine that
# can send email from the command line
#
#############################   

if [ $# -ne 2 ]; then
    echo "Usage: emailGrades.sh <USERLIST> <ASSIGNMENT>"
    exit 0
fi

userlist=$1
ASSIGNMENT=$2

cat $userlist |
while IFS=$'\t' read -r -a myArray; do
   SECTION=${myArray[0]}
   LAST=${myArray[1]}
   FIRST=${myArray[2]}
   EMAIL=${myArray[3]}
   USERNAME=${myArray[4]}
   REPO=${myArray[5]}
   SECTION=${myArray[6]}
   CLASS=${myArray[7]}
   echo "+++++++++++++++++++++++++++++"
   echo Name: $LAST, $FIRST EMAIL: $EMAIL
   echo "+++++++++++++++++++++++++++++"
   export REPLYTO="jklay@calpoly.edu"
   TO_ADDRESS="${EMAIL}@calpoly.edu, jklay@calpoly.edu"
   FROM_ADDRESS="jklay@calpoly.edu"
   SUBJECT="Graded ${ASSIGNMENT}"
   BODY1="Hi ${FIRST},
Here are the grader's comments, notes and scores for your ${ASSIGNMENT}.
Please let me know if you have any questions.

Cheers,
JLK      


Summary:
"
   BODY2=`cat Students/${USERNAME}/${LAST}_${ASSIGNMENT}.txt`

   echo $TO_ADDRESS
   echo $ATTACH
   echo $SUBJECT
   echo "$BODY1" > /tmp/tmpfile.txt
   echo "$BODY2" >> /tmp/tmpfile.txt
   mutt -s "$SUBJECT" -- $TO_ADDRESS < /tmp/tmpfile.txt
#  echo "################"
#  cat /tmp/tmpfile.txt  
done
cd - >& /dev/null

#
# All content is under a modified MIT License,
# and can be freely used and adapted.
# See the full license text in LICENSE.
#