#!/bin/bash
full_path=$(realpath $0)
dir_path=$(dirname $full_path)
docker kill mysql_example
docker rm mysql_example
sudo rm -rf $dir_path/persisted_data
