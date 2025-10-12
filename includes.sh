#!/bin/bash

##############################################
#                  SETTINGS                  #
##############################################

# Mask
umask 022

# Locale
export LANG="fr_FR.UTF-8"

# IP
export IP_NAS="192.168.100.200"

# URL
export URL_NAS="http://${IP_NAS}"
export URL_PROXMOX="${URL_NAS}/proxmox"
export URL_SCRIPTS="${URL_NAS}/scripts"
export URL_VARIABLES="${URL_NAS}/variables"

# Fonctions
function check_ping {
	ping -c 1 -W 1 "${1}" >/dev/null 2>&1
}

function check_server {
	if [[ -n "${1}" ]] && [[ ! "$(hostname)" =~ ^(${1})$ ]]
	then
		return 1
	fi
}

# Programme
check_server "${ALLOWED}"
if [[ "$?" -ne 0 ]]
then
	echo "Ce script ne peut pas s'exécuter sur ce serveur"
	exit 1
fi
check_ping "${IP_NAS}"
if [[ "$?" -eq 0 ]]
then
	source <(curl -s "${URL_VARIABLES}/includes.sh")
fi

