#!/bin/bash


grep -ri disk_id ./terraform.tfstate | awk -F":" {'print $2 '} |  tr -d '\n' | sed 's/.$//'