#!/bin/bash

nginx_config='/etc/nginx/sites-available/default'


if [ "$1" == "on" ] || [ "$1" == "off" ] #Checking correct input
then
	if [ "$1" == "on" ]
	then
		echo "Activating autoindex"
		sed -i 's/autoindex off/autoindex on/' $nginx_config;
		service nginx restart;
		echo -e "Autoindex is now ON"
	else
		echo "Deactivating autoindex"
		sed -i 's/autoindex on/autoindex off/' $nginx_config;
		service nginx restart;
		echo -e "Autoindex is now OFF"
	fi
# If input was incorrect
else
	echo "Invalid input. Please select 'on' | 'off'"
fi
