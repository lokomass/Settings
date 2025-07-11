# Settings

Permet de renseigner toutes les **fonctions/variables** nécessaires au fonctionnement des scripts.  
Le code est regroupé dans un fichier unique pour réduire les accès réseau.

## Exemples

### Short

```
SHORT=1
source <(curl -sL "https://settings.domain.ltd") 2>/dev/null
```

### Full

```
# Github
ALLOWED="pve|NAS.*"
source <(curl -sL "https://settings.domain.ltd") 2>/dev/null
if [[ "${API_ALIVE}" != "1" ]]
then
	exit 1
fi
```

