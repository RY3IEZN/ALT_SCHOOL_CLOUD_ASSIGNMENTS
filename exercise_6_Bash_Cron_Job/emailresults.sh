#!/bin/bash

pathtofile="/home/ubuntu/memorylogs"

echo $pathtofile

	if [[ -f ${pathtofile} ]]
	then
		mutt -s "Here are today's memory logs" -- ghostlordwalker@gmail.com  < "${pathtofile}"
	fi

echo "email sent"
