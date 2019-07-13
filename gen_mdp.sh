#!/bin/bash

set -e

USAGE="Usage : ./gen_mdp.sh [NB_MOTS] [LON_MOT] \n\
  NB_MOTS: (optionnel) nombre de mots dans le mot de passe\n\
  LON_MOT: (optionnel) longueur minimale des mots"

[ "$1" = "-h" ] && echo -e "$USAGE" && exit
[ "$1" = "--help" ] && echo -e "$USAGE" && exit

DICO_FICHIER="./dico/liste_francais.txt"

NB_MOTS=$1
LON_MOT=$2

[ -z "$NB_MOTS" ] && NB_MOTS=3 || true
[ -z "$LON_MOT" ] && LON_MOT=5 || true

echo $( awk "length(\$0)>$LON_MOT" "${DICO_FICHIER}" | shuf -n $NB_MOTS )
