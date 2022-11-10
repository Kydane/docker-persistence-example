#!/bin/bash

#This creates the volume
docker volume create named_mysql_volume

#All the options are the same as in option1 instead we are saving the data inside of docker itself. 
docker run -d -v named_mysql_volume:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true --name mysql_example mysql:latest
