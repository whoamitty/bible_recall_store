
#cat list_old | tr '[:upper:]' '[:lower:]' | sed -E 's/([0-9]+) ([a-zA-Z]+)/\1-\2/g' |  sed 'y/éèêëï/eeeei/'  #> list_formated_old


# Bible Audio Recall Store

Un dépôt(non encore fonctionnel)  
pour stocker et organiser des playlists audio de la Bible française, optimisé pour une lecture avec MPV.
J'ai l'intention de l'utiliser pour un prochain projet nommé **RecallCli**

## Structure du projet

```
.
├── new_testament/           # Playlists du Nouveau Testament
├── old_testament/           # Playlists de l'Ancien Testament
│   └── genese              # Exemple d'un livre avec sa playlist
├── README.md                # Ce fichier
├── setup_datas/             # Données pour générer les playlists
│   ├── list_formated_new    # Liste formatée du Nouveau Testament
│   ├── list_formated_old    # Liste formatée de l'Ancien Testament
│   ├── list_new             # Liste brute du Nouveau Testament
│   └── list_old             # Liste brute de l'Ancien Testament
└── setup.sh                 # Script de génération des playlists
```

## Description

Ce projet contient des playlists audio de la Bible en français,  
organisées par livre pour une écoute facile avec MPV.  
Les playlists sont générées automatiquement à partir du site audio.emcitv.com et  
organisées par Testaments, livres, et chapitres.    

## Utilisation avec MPV

Pour écouter un livre de la Bible avec MPV :  

```bash
# Écouter la Genèse
mpv --playlist=old_testament/genese

# Écouter un livre spécifique du Nouveau Testament
mpv --playlist=new_testament/matthieu
```

### Options recommandées pour MPV

Pour une meilleure expérience d'écoute :

```bash
# Lecture continue
mpv --playlist=old_testament/genese --loop-playlist=inf

# Mémoriser la position et reprendre la lecture
mpv --playlist=old_testament/genese --save-position-on-quit

# Lecture aléatoire
mpv --playlist=old_testament/genese --shuffle
```

## Génération des playlists

Le script `setup.sh` permet de générer automatiquement les playlists. Il extrait les informations des fichiers dans `setup_datas/` et crée les listes d'URLs correspondantes.

Pour générer ou mettre à jour les playlists :

```bash
./setup.sh
```

## Personnalisation

- Modifiez la variable `voice_version` (version 2 ou rien) dans `setup.sh` pour changer la version vocale.
- Ajoutez de nouveaux livres en modifiant les fichiers dans `setup_datas/`.

## Contribution

N'hésitez pas à contribuer à ce projet en :
- Améliorant le script de génération
- Ajoutant des options pour d'autres sources audio
- Créant des configurations MPV optimisées pour l'écoute biblique

## Licence

[MIT]

## Notes

Ce projet est personnel et créé pour faciliter l'écoute régulière de la Bible.  
Les fichiers audio référencés appartiennent à leurs propriétaires respectifs (emcitv.com).


# Source for audios
https://emcitv.com/bible/audio/  
https://emcitv.com/bible/audio/osee-voix-fr1.html  
https://emcitv.com/bible/audio/osee-voix-fr2.html  

# Source for write number of chapter in the setup dataset
https://www.catholic-resources.org/Bible/OT-Statistics-NAB.htm  
https://www.catholic-resources.org/Bible/NT-Statistics-Greek.htm    
