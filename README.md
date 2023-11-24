Coucou, on est les meilleurs ! (et sans appeler Loup une seule fois)

UTILISATION DE NOTRE GROS-TP


ETAPE 0:

S'assurer que nginx/apache ou tout service utilisant les ports 80 et 443 soient désactivés.


ETAPE 1:

Créer puis copier sa clef publique ssh dans GROS-TP :

cp ~/.ssh/id_rsa.pub sshd/id_rsa.pub

ETAPE 2:

sudo docker-compose up -d --build


ETAPE 3: 

Utiliser mdm.sh à votre guise !
bash mdm.sh --help		  # pour avoir les infos

ETAPE 4:

Rentrer l'addresse suivante sur votre navigateur :

https://1.2.3.2

ETAPE 5:

Visualisation des groupes :

https://1.2.3.2/[nom-groupe]

ETAPE 6:

ADMIREZ NOTRE TRAVAIL



-------

Si une erreur de type " ATTENTION : MAN IN THE MIDDLE ATTACK " apparait.

Supprimer known_hosts dans votre dossier .ssh de votre répertoire personnel :

rm ~/.ssh/known_hosts
