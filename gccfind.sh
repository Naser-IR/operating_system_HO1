#!/bin/bash
#Naser Rabah 207811282
if (($# < 2))
then
    echo "Not enough parameters"
#####
else 
pwd=$PWD
cd $1
for f in $(ls)
do
    if [[ $f  == *.out ]]; then
    	rm $f
    fi
done
###########
for f in $(ls)
do
    if [[ $f  == *.c ]]; then
    	if (( $(grep -c -w -i $2 $f) ))
    	then 
            gcc -w -o "${f%.*}".out $f
    	fi
    fi
done
########
if [[ "$3" == "-r" ]]
then
    temp=$PWD
    for f in */
    do
	if test -d "$f"
	then
	    cd $pwd
	    $($0 $1/$f $2 $3)
	    cd $temp
	fi
    done
fi
fi

