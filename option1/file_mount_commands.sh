#!/bin/bash

# I'm just getting where this path is being run.
full_path=$(realpath $0)
dir_path=$(dirname $full_path)

# This is going to start up a mysql database with the database persisted to persisted_data.
# This command has 4 flags:
# Flag 1: -d or "detached" which just means "please don't run this in the terminal i'm using. run it in the background"
# Flag 2: -v This flag accepts source:destination. 
# Source in this case says "Where on your actual computer do you want these files to live"
# Destination in this case says "where in the container should we mount your directory" 
# I am mounting persisted_data on my machine to /var/lib/mysql in the container
# Flag 3: -e is just an enviornment variable that says "please, i don't care about the password."
# Flag 4: --name. just naming my container

docker run -d -v $dir_path/persisted_data:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=true --name mysql_example mysql:latest
