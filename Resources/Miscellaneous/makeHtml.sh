#!/bin/bash
##############################
#
# A simple script for generating
# HTML pages for a large number
# of notebooks quickly. 
#
##############################

ipynblist=`ls *.ipynb`

for nb in $ipynblist; do
#  echo $nb
  book=`basename $nb`
  foo=`echo $book | awk -F . '{print $1}'`
  ipython nbconvert --to html $nb
  mv ${foo}.html html/
done

#
# All content is under a modified MIT License,
# and can be freely used and adapted.
# See the full license text in LICENSE.
#

