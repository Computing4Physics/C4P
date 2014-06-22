#!/bin/bash

if [ $# -ne 0 ]; then
    echo "Usage: makeProjectGradebook.sh"
    return
fi
	
#Put it in the Students directory so it stays out of version control
outfile=Students/ProjectGrades.ipynb
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
echo '     "Project Grades"' >> $outfile
echo '     ]' >> $outfile
echo '    },' >> $outfile
		     

cat projectlist.txt |
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
   QUESTION=`cat Students/${USERNAME}/${LAST}_ProjectQuestion.txt`
   echo '    {' >> $outfile
   echo '     "cell_type": "code",' >> $outfile
   echo '     "collapsed": false,' >> $outfile
   echo '     "input": [' >> $outfile
   echo '      "%%file '${USERNAME}'/'${LAST}'_'${PROJECT}'.txt\n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Design: \n",' >> $outfile
   echo '      "    (Project is well-organized, easy to follow and clearly\n",' >>$outfile
   echo '      "     states the problem being solved.) \n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Documentation: \n",' >> $outfile
   echo '      "    (Instructions for how to run the code are included. \n",' >> $outfile
   echo '      "     Variable and function names are descriptive. Code includes\n",' >> $outfile
   echo '      "     comments that aid the reader in following the algorithm. \n",' >>$outfile
   echo '      "     Algorithms/functions include test cases that clearly show\n",' >> $outfile
   echo '      "     they successfully accomplish their stated goals.) \n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Completeness: \n",' >> $outfile
   echo '      "    (All of the major elements of the project have been included.) \n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Correctness: \n",' >> $outfile
   echo '      "    (The logic of the code is correct and it produces meaningful results.) \n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Analysis: \n",' >> $outfile
   echo '      "    (All of the analysis questions in the project description\n",' >> $outfile
   echo '      "     have been answered/addressed. Interpretation of the results\n",' >> $outfile
   echo '      "     is included.)\n",' >> $outfile
   echo '      "\n",' >> $outfile
   echo '      "Research question: \n",' >> $outfile
   echo '      "    '${QUESTION}' \n",' >> $outfile
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
   echo '      "!cd '${USERNAME}'/'${REPO}'/Project; git log '${PROJECT}'Project.ipynb",' >> $outfile
   echo '      "!cd '${PROJECT}'; rm '${USERNAME}'.ipynb; ln -s ../'${USERNAME}'/'${REPO}'/Project/'${PROJECT}'Project.ipynb '${USERNAME}'.ipynb"' >> $outfile
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