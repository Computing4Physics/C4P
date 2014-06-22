#!/bin/bash

#############################
#
# Generate a grading notebook
# for given assignment for 
# students from information
# stored in the <USERLIST> file.
#
#############################   

if [ $# -ne 1 ]; then
    echo "Usage: makeGradeNotebook.sh <ASSIGNMENT>"
    return
fi
	
ASSIGNMENT=$1

#Put it in the Students directory so it stays out of version control
outfile=Students/${ASSIGNMENT}Grades.ipynb
rm -rf $outfile
touch $outfile

#preamble:
echo '{' >> $outfile
echo ' "metadata": {' >> $outfile
echo ' "name": "",' >> $outfile
echo ' "signature": "sha256:89cb48ba610b90892ec35639158d3db082840a14777cb62ac16041702a3be8c8"' >> $outfile
echo ' },' >> $outfile
echo ' "nbformat": 3,' >> $outfile
echo ' "nbformat_minor": 0,' >> $outfile
echo ' "worksheets": [' >> $outfile
echo '  {' >> $outfile
echo '   "cells": [' >> $outfile
echo '    {' >> $outfile
echo '     "cell_type": "heading",' >> $outfile
echo '     "level": 1,' >> $outfile
echo '     "metadata": {},' >> $outfile
echo '     "source": [' >> $outfile
echo '     "'${ASSIGNMENT}' Grades"' >> $outfile
echo '     ]' >> $outfile
echo '    },' >> $outfile
		     

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
   echo '    {' >> $outfile
   echo '     "cell_type": "code",' >> $outfile
   echo '     "collapsed": false,' >> $outfile
   echo '     "input": [' >> $outfile
   echo '      "%%file '${USERNAME}'/'${LAST}'_'${ASSIGNMENT}'.txt\n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Question 1: \n",' >> $outfile
   echo '      "    (a) \n",' >> $outfile
   echo '      "    (b) \n",' >> $outfile
   echo '      "    (c) \n",' >> $outfile
   echo '      "    (d) \n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Question 2: \n",' >> $outfile
   echo '      "    (a) \n",' >> $outfile
   echo '      "    (b) \n",' >> $outfile
   echo '      "    (c) \n",' >> $outfile
   echo '      "    (d) \n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Total: \n",' >> $outfile
   echo '      "\n"' >> $outfile
   echo '    ],' >> $outfile
   echo '    "language": "python",' >> $outfile
   echo '    "metadata": {},' >> $outfile
   echo '    "outputs": []' >> $outfile
   echo '    },' >> $outfile
   echo '    {' >> $outfile
   echo '     "cell_type": "code",' >> $outfile
   echo '     "collapsed": false,' >> $outfile
   echo '     "input": [' >> $outfile
   echo '      "!cd '${USERNAME}'/'${REPO}/SymPy'; git log '${ASSIGNMENT}'Exercises.ipynb",' >> $outfile
   echo '      "!cd '${ASSIGNMENT}'; rm '${USERNAME}'.ipynb; ln -s ../'${USERNAME}'/'${REPO}'/SymPy/'${ASSIGNMENT}'Exercises.ipynb '${USERNAME}'.ipynb"' >> $outfile
   echo '     ],' >> $outfile
   echo '     "language": "python",' >> $outfile
   echo '     "metadata": {},' >> $outfile
   echo '     "outputs": []' >> $outfile
   echo '    },' >> $outfile
   echo '    {' >> $outfile
   echo '     "cell_type": "markdown",' >> $outfile
   echo '     "metadata": {},' >> $outfile
   echo '     "source": [' >> $outfile
   echo '     "---"' >> $outfile
   echo '     ]' >> $outfile
   echo '    },' >> $outfile
done

echo '    {' >> $outfile
echo '     "cell_type": "markdown",' >> $outfile
echo '     "metadata": {},' >> $outfile
echo '     "source": [' >> $outfile
echo '      "---"' >> $outfile
echo '     ]' >> $outfile
echo '    }' >> $outfile
echo '   ],' >> $outfile
echo '   "metadata": {}' >> $outfile
echo '  }' >> $outfile
echo ' ]' >> $outfile
echo '}' >> $outfile
					   
#
# All content is under a modified MIT License,
# and can be freely used and adapted.
# See the full license text in LICENSE.
#