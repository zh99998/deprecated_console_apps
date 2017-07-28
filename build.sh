#!/usr/bin/env bash

for app in $*
do
    docker run -it -v /data/apps:/data/apps:ro -v /data/release:/data/release console node main.js ${app} 1
    bash deploy.sh ${app}
done 
