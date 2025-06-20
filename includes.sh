#!/bin/bash

##############################################
#                  SETTINGS                  #
##############################################

# Locale
export LANG="fr_FR.UTF-8"

# Volume
export VOLUME_NAS="/volume1"
export VOLUME_USB="/volumeUSB1/usbshare"

# Folder
export FOLDER_SYSTEME="${VOLUME_NAS}/Systeme"
export FOLDER_LOGS="${FOLDER_SYSTEME}/Logs"
export FOLDER_WEB="${VOLUME_NAS}/web"

# IP
export IP_NAS="192.168.100.150"

# Fonctions
function write_log {
	local TIME=$(date +"%H:%M:%S")
	echo "[${TIME}] ${1}" >> "${2}"
}

function check_ping {
	ping -c 1 -W 1 "${1}" >/dev/null 2>&1
	echo "$?"
}

function check_server {
	if [[ ! -z "${1}" ]] && [[ ! "$(hostname)" =~ ^(${1})$ ]]
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
elif [[ $(check_ping "${IP_NAS}") -eq 0 ]]
then
	source <(curl -s "http://${IP_NAS}/variables/includes.sh")
fi

