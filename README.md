# Settings

Ce fichier a pour but de fournir des **fonctions/variables** aux serveurs distants.  
Le code est regroupé dans un fichier unique pour réduire les accès réseau.

## Exemple

```
# Github
ALLOWED="pve|NAS.*"
source <(curl -s "https://raw.githubusercontent.com/lokomass/settings/main/includes.sh") 2>/dev/null
if [[ "${API_ALIVE}" != "1" ]]
then
	exit 1
fi
```

