#!/bin/bash
# Created by Mark Revill, MGRLabs

# Grab the URL for the latest version of Azure ace-engine and download it using wget
# If generating from macOS, substitute 'linux' for 'darwin' in line 7
curl -s https://api.github.com/repos/azure/acs-engine/releases/latest \
| grep "browser_download_url.*linux*.*gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -

#Extract acs-engine to the current directory
tar -xvf acs*.gz -C ./ --strip-components 1

#Output the input file to insure it's correct :)
cat ./kubernetes.json

#Run acs-engine to generate Azure ARM artifacts
./acs-engine generate kubernetes.json

#tar -cvf acsengine-output.tar ./_output/*
