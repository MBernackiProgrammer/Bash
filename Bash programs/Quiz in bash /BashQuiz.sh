#!/bin/bash

#Nazwa użytkownika, która zostanie zapisana w pliku porównawczym
UserName=""
echo "Podaj nazwe uzytkownika"
read UserName;

#Na ile pytań już odpowiedziano
zmienna=1
#Ile ma być pytan (max bo to do while)
Max=0
#ile punktów osiągnął gracz 
PlusPoints=0

echo "Ile ma byc pytan"
read Max

#Zamiana na int
Max=$(( Max ))

#Do while do pytan
while [ $zmienna -le $Max ]
do

#Dodaje ile pytan już bylo
zmienna=$(($zmienna + 1))
################################################
# Mechanizm losowania pytania (Oczywiscie pseodoslosowego)
################################################

#Pobieranie milisekund 
Liczba=`date +%s%N`
#Zczytywanie ilości linijek z pliku pytania 
Linijki=`wc -l < Pytania`
#Obliczanie ilości pytan 
result=$(( $Linijki / 8 ));
#Wlasciwy moment "Losowania" za pomoca modulo
losowe=`expr $Liczba % $result`
#Wyszukiwanie "wskaźnika" pytania
cash=$(( $losowe * 8))
cash=$(( $cash + 1))
#Przypisaine QId (QuestionID) wskaźnika pytania
QId=`awk 'NR=='$cash Pytania`

cash=$(( $cash + 1))
#Wyświetla pytanie 
echo `awk 'NR=='$cash Pytania`

################################################
# Wyswietlanie - Pytanie 1
################################################

cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
# Wyswietlanie - Pytanie 2
################################################

cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
# Wyswietlanie - Pytanie 3
################################################
cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
# Wyswietlanie - Pytanie 4
################################################
cash=$(( $cash + 1))
cash2=`awk 'NR=='$cash Pytania`

if [ "$cash2" != "" ]
then
	echo $cash2
	
fi

################################################
# Mechanizm sprawdzania odpowiedzi
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

var1=10
var2=3
kpj="scale=2; $PlusPoints/$Max" | bc
echo "scale=2; $PlusPoints/$Max" | bc


echo "Skutecznosc na poziomie : $kpj" >> Wyniki