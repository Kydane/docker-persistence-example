#!/bin/bash
docker kill mysql_example
docker rm mysql_example
docker volume rm named_mysql_volume