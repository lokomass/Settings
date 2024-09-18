#!/bin/bash
export IP_NAS="192.168.100.150"
export URL_VARIABLES="http://$IP_NAS/variables"
source <(curl -s "$URL_VARIABLES/includes.sh")

