#!/bin/bash
bat_alert=$( acpi | cut -d, -f2 | sed 's/%//g')
bat_etat=$( acpi | cut -d, -f1 | sed ' s/ //g'  | cut -d: -f2)'')
if [ $bat_etat = "Discharging" ] && [ $bat -le "100" ]
then
	zenity --info --text=" Veuillez Branchez Votre Chargeur vous n' avez plus que $bat%'"  --ellipsize --icon-name=battery 
fi





