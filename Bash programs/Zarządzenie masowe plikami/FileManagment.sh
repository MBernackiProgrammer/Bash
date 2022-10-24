#!/bin/bash

taskNb=0
pathWork=""
echo Drogi użytkowniku, wygrałeś iphone 9,
echo ale zanim to to musisz wybrać mi zadanie
echo 1 - zmien nazwy plików w katalogu na wielkie 
echo 2 - zmien nazwy plików na małe litery 
echo 3 - skróć nazwy plików 
echo 4 - wysczyść zawartość plików 

read taskNb

echo Hej, proszę podaj jeszcze ścieżkę, na której mam pracować


read pathWork

echo $pathWork

rm -r /home/test2/PathChangerHelper
cp -R "$pathWork" "/home/test2/PathChangerHelper"

if [ $taskNb -eq 1 ]
then 
	for entry in `ls "$pathWork"`; do
    		echo $entry
    		
    		teste=$pathWork/${entry^^}
    		
    		if [[ -f  $teste ]]
		then 
			echo znaleziono taki sam plik, który miał by taką samą nazwę po zmianie pod ścieżką $pathWork/$entry
    			echo wpisz, byle co, abym wiedział, że ty wiesz
    			read 
		else 
			mv $pathWork/$entry $pathWork/${entry^^}
		fi 
	done	
fi

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
	echo nic
fi 

if [ Odp = "N" ]
then
	#Nadpisz 
	rm -r "$pathWork"
	cp -R "/home/test2/PathChangerHelper" "$pathWork"
fi 
