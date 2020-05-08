# ninvaders-buildroot-RP3

Projet crée dans le cadre de ma formation en cyberdéfense, module "Linux Embarqué".
L'idée est de créer un système ne contenant que le strict minimum pour faire tourner un applicatif donné, ici nInvaders, pour limiter les surfaces d'attaques possibles.

Les détails se trouvent dans le rapport fourni dans le repo.


## Informations sur la cible

___

Compte root
ID : **root**
Mdp : **test**

____

Adresse IP de la cible : **192.168.0.3/24**

____

Update possible à travers le réseau :

-  `$ ./update.sh -m`depuis la racine du dossier buildroot. Cette action make puis transfère automatiquement les données modifiées vers la cible à travers une connexion SSH. Cette action nécessite un chemin d'accès sur le poste local pour la synchronisation du firmware, une modification dans le script doit être effectué à la ligne 27 afin d'ajuster le dossier local `rpi-firmware`sur votre machine: 

  ```
  rsync -r -a -v -e ssh --delete /home/linuxembedded/ProjetLinuxEmbedded/buildroot-2019.08.1/output/images/rpi-firmware root@192.168.0.3:/tmp/rpi
  ```

  

- En cas de problème d'accès à l'URL de téléchargement du paquet nInvaders, modifier le fichier ninvaders.mk en ajustant les premières lignes :

```
NINVADERS_VERSION = 0.1.1
NINVADERS_SOURCE = ninvaders-$(NINVADERS_VERSION).tar.gz
NINVADERS_SITE = http://downloads.sourceforge.net/project/ninvaders/ninvaders/0.1.1
NINVADERS_INSTALL_STAGING = YES
NINVADERS_DEPENDENCIES = ncurses
```

