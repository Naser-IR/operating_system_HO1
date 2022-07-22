#Naser Rabah 207811282
#!/bin/bash
SHOULD=" --------------------------------- "
CACHE=" |       |       #       |       | "
OTHER_ARGUMENTS=" |       |       O       |       | "
var1=50
var2=50
var3=0
var4=0
# Loop through arguments and process them
update() {
     var4=1;
     var1=$((var1-PICK1));
     var2=$((var2-PICK2));
     if ((PICK1 > PICK2))
     then var3=$((var3+1));
     if ((var3==0))
     then var3=$((var3+1));
     fi
     elif ((PICK1 < PICK2))
     then var3=$((var3-1));
     if ((var3==0))
     then var3=$((var3-1));
     fi
     fi
     start
}
start() {

    case $var3 in
        0)
        OTHER_ARGUMENTS=" |       |       O       |       | "
        shift # Remove --initialize from processing
        ;;
        1)
        OTHER_ARGUMENTS=" |       |       #   O   |       | "
        shift # Remove --cache= from processing
        ;;
        -1)
        OTHER_ARGUMENTS=" |       |   O   #       |       | "
        shift # Remove argument name from processing
        ;;
        2)
        OTHER_ARGUMENTS=" |       |       #       |   O   | "
        shift # Remove generic argument from processing
        ;;
        -2)
        OTHER_ARGUMENTS=" |   O   |       #       |       | "
        shift # Remove generic argument from processing
        ;;
        3)
        OTHER_ARGUMENTS=" |       |       #       |       |O"
        shift # Remove generic argument from processing
        ;;
        -3)
        OTHER_ARGUMENTS="O|       |       #       |       | "
        shift # Remove generic argument from processing
        ;;
    esac

echo " Player 1: ${var1}         Player 2: ${var2} "
echo "$SHOULD"
echo "$CACHE"
echo "$CACHE"
echo "$OTHER_ARGUMENTS"
echo "$CACHE"
echo "$CACHE"
echo "$SHOULD"
if ((var4>0))
then
echo  "       Player 1 played: ${PICK1}  "
echo  "       Player 2 played: ${PICK2}  "
echo  ""
echo  ""
fi
if ((var3==3))
then echo "PLAYER 1 WINS !"
elif ((var3==-3))
then echo "PLAYER 2 WINS !"
elif ((var2==0)) && ((var1>0))
then echo "PLAYER 1 WINS !" #exit
elif ((var1==0)) && ((var2>0))
then echo "PLAYER 2 WINS !"
elif ((var1==0)) && ((var2==0))
then echo "IT'S A DRAW !"
else
## pick first number
echo "PLAYER 1 PICK A NUMBER: "
read -s PICK1
while ((var1-PICK1 < 0)) || ! [[ "$PICK1" =~ ^[0-9]+$ ]]
do echo "NOT A VALID MOVE !"
echo "PLAYER 1 PICK A NUMBER: "
read -s PICK1
done


## pick second number
echo "PLAYER 2 PICK A NUMBER: "
read -s PICK2
while ((var2-PICK2 < 0)) || ! [[ "$PICK2" =~ ^[0-9]+$ ]]
do echo "NOT A VALID MOVE !"
echo "PLAYER 2 PICK A NUMBER: "
read -s PICK2
done

#check if its real number
#if there isnt a winner yet call function to updater the variables (scores then call start again
update
fi
}
start
