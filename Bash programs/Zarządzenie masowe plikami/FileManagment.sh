#!/bin/bash

taskNb=0
pathWork=""
#Print menu 
echo Drogi użytkowniku, wygrałeś iphone 9,
echo ale zanim to to musisz wybrać mi zadanie
echo 1 - zmien nazwy plików w katalogu na wielkie 
echo 2 - zmien nazwy plików na małe litery 
echo 3 - skróć nazwy plików 
echo 4 - wysczyść zawartość plików 

#Get option 
read taskNb

echo Hej, proszę podaj jeszcze ścieżkę, na której mam pracować

#Get path 
read pathWork

echo $pathWork

#Create copy 
rm -r /home/test2/PathChangerHelper
cp -R "$pathWork" "/home/test2/PathChangerHelper"


#If is anweser 1 - change to BIG letter
if [ $taskNb -eq 1 ]
then 
	for entry in `ls "$pathWork"`; do
    		echo $entry
    		
    		noteste=$pathWork/$entry
    		teste=$pathWork/${entry^^}
    		echo $teste
    		
    		if [[ -f "$teste" ]]
		then 
			if [[ "$noteste" = "$teste" ]]
			then
				echo Plik "$teste" nie musi zostać zmieniony
			else
				echo znaleziono taki sam plik, który miał by taką samą nazwę po zmianie pod ścieżką $pathWork/$entry
    				echo wpisz, byle co, abym wiedział, że ty wiesz
    				read 
			fi 
			
		else 
			echo ten $teste plik spoko, nic
			mv $pathWork/$entry $pathWork/${entry^^}
		fi 
		
		if [[ -f "$teste" ]]
		then 
			echo mamy to 
		else 
			echo nie mamy tego FFF
		fi 
	done	
fi

#If is anweser 2 - change to small letter
if [ $taskNb -eq 2 ]
then 
	for entry in `ls "$pathWork"`; do
    		echo $entry
    		mv -i $pathWork/$entry $pathWork/${entry,,}
	done	
fi

if [ $taskNb -eq 3 ]
then 
	echo Wybierz opcję 
	echo 1 - skróć o 
	echo 2 - skróć do 
	
	read Opcja 
	
	if [ $Opcja -eq 1 ]
	then 
		echo o ile skrócić 
		read dlugosc 
	
		for entry in `ls "$pathWork"`; do
    			echo $entry
    			mv $pathWork/$entry $pathWork/${entry::-dlugosc}
		done	
	fi 
	
	if [ $Opcja -eq 2 ]
	then 
		echo ile ma pozostać liter
		read dlugosc 
	
		for entry in `ls "$pathWork"`; do
    			echo $entry
    			mv $pathWork/$entry $pathWork/${entry::dlugosc}
		done	
	fi 
	
	
	
fi

if [ $taskNb -eq 4 ]
then
 	for entry in `ls "$pathWork"`; do
 		echo "" > $pathWork/$entry
	done
fi 

echo Czy zachować zmiany T/N
read Odp 
if [ Odp = "T" ]
then
	#Nic nie rób
	rm -r "/home/test2/PathChangerHelper"
fi 

if [ Odp = "N" ]
then
	#Nadpisz 
	rm -r "$pathWork"
	cp -R "/home/test2/PathChangerHelper" "$pathWork"
fi 
