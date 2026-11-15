read -p "Enter 3 numbers:" a b c
if [ $a -ge $b ] && [ $a -ge $c ]
then
echo "$a is greatest"
elif [ $b -ge $a ] && [ $b -ge $c ]
then
echo "$b is greatest"
else 
echo "$c is greatest"
fi
