#!/bin/bash
cd "$(dirname "$0")"

# copy eom-f16 directory to massart.andrewringler.com overwriting previous
/usr/bin/rsync --cvs-exclude --exclude=".git/" --exclude=".DS_Store" --delete -avz -e ssh . massart.andrewringler.com:/home/andrewringler_massart/massart.andrewringler.com/www/eom-f16/
