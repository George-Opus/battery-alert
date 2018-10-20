#!/bin/bash
test="0"

while true :
do
	bat_alert=$( acpi | cut -d, -f2 | sed 's/%//g')
	bat_etat=$( acpi | cut -d, -f1 | sed ' s/ //g'  | cut -d: -f2)
	if [ $bat_etat = "Discharging" ] && [ $bat_alert -le "15" ] && [ $test -eq "0" ] 
	then
		zenity --info --text=" Veuillez Branchez Votre Chargeur vous n' avez plus que $bat_alert%'"  --ellipsize --icon-name=battery 
		test=1	
	fi
	
	if [ $bat_alert -ge "16" ] && [ $test -eq "1" ]
	then
		test=0	
	fi
	
done
