#!/bin/bash

set -e

USAGE="Usage : gen_mdp.sh [NB_MOTS] [LON_MOT] \n\
  NB_MOTS: (optionnel) nombre de mots dans le mot de passe\n\
  LON_MOT: (optionnel) longueur minimale des mots"

[ "$1" = "-h" ] && echo -e "$USAGE" && exit
[ "$1" = "--help" ] && echo -e "$USAGE" && exit

DICO_FICHIER="/Users/leolelonquer/Dropbox/Projets/generateur_mdp/dico/liste_francais.txt"

NB_MOTS=$1
MIN_LON_MOT=$2
MAX_LON_MOT=$3

[ -z "$NB_MOTS" ] && NB_MOTS=3 || true
[ -z "$MIN_LON_MOT" ] && MIN_LON_MOT=0 || true
[ -z "$MAX_LON_MOT" ] || [[ "$MIN_LON_MOT" < "$MAX_LON_MOT" ]] || \
  (echo "ERREUR : MAX_LON_MOT(param3) inférieur à MIN_LON_MOT(param2)" && exit)

COND="length(\$0)>$MIN_LON_MOT"
[ -z "$MAX_LON_MOT" ] || COND="$COND && length(\$0)<$MAX_LON_MOT"

echo $( awk "$COND" "${DICO_FICHIER}" | shuf -n $NB_MOTS )
