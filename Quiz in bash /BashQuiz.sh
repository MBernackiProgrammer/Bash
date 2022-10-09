#!/bin/bash

UserName=""
echo "Podaj nazwe uzytkownika"
read UserName;

zmienna=1
Max=0
PlusPoints=0

echo "Ile ma byc pytan"
read Max

Max=$(( Max ))

while [ $zmienna -le $Max ]
do
echo $zmienna
zmienna=$(($zmienna + 1))
Liczba=`date +%s%N`
Linijki=`wc -l < Pytania`
result=$(( $Linijki / 8 ));
losowe=`expr $Liczba % $result`
cash=$(( $losowe * 8))
cash=$(( $cash + 1))
QId=`awk 'NR=='$cash Pytania`
cash=$(( $cash + 1))
echo `awk 'NR=='$cash Pytania`

################################################
#
# Pytanie 1
#
################################################

cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
#
# Pytanie 2
#
################################################

cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
#
# Pytanie 3
#
################################################
cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
#
# Pytanie 4
#
################################################
cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
#
# Sprawdzanie odpowiedzi
#
################################################

xd=""
read xd

cash=$(( $cash + 1))
cso=`awk 'NR=='$cash Pytania`

echo "$QId"

if [ "$QId" = "0" ]
then 
	if [ "$xd" = "$cso" ]
		then
			echo "Hurra, poprawna odpowiedz"
			PlusPoints=$(( $PlusPoints+1 ))
	

	else
		echo "Ahh... nie tym razem"
	fi
fi

if [ "$QId" = "1" ]
then 
	if [ "$xd" = "$cso" ]
		then
			echo "Hurra, poprawna odpowiedz"
			PlusPoints=$(( $PlusPoints+1 ))
	

	else
		echo "Ahh... nie tym razem"
	fi
fi

if [ "$QId" = "2" ]
then 
	text="$cso"

# Set comma as delimiter
	IFS=':'

#Read the split words into an array based on comma delimiter
	read -a strarr <<< "$text"

#Print the splitted words
	min="${strarr[0]}"
	max="${strarr[1]}"

	if [ $(($xd)) -ge $(($min)) ]
		then
			if [ $(($max)) -ge $(($xd)) ]
				then 
					echo "Hurra, poprawna odpowiedz"
					PlusPoints=$(( $PlusPoints+1 ))
				else
					echo "Ahh... nie tym razem"
			fi
	

		else
			echo "Ahh... nie tym razem"
	fi
fi







done

echo "Uzyskales $PlusPoints punktow"

echo "Gracz : $UserName odpowiedzial poprawnie na : $PlusPoints / $Max" >> Wyniki

varXD="scale=2; $PlusPoints / $Max * 100" | bc

echo "Skutecznosc na poziomie : $varXD %" >> Wyniki