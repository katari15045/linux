
# if - elif - else - gt - lt
if [ ${1} -gt ${2} ]
then
	echo "greater"
elif [ ${1} -lt ${2}  ]
then
	echo "lesser"
else
	echo "equal"
fi

# -eq
if [ $1 -eq 9 ]
then 
	echo "lucky number!"
fi

# -ne
if [ $1 -ne 6 ]
then 
	echo "bach gaya"
fi

# -ge
if [ $1 -ge 10 ]
then
	echo "non-single-digit number"
fi

# -le
if [ $1 -le -1 ]
then
	echo "negative"
fi



