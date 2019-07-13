#!/bin/bash

set -e

DICO_FICHIER="./dico/liste_francais.txt"

NB_MOTS=$1
LON_MOT=$2

[ -z "$NB_MOTS" ] && NB_MOTS=3 || true
[ -z "$LON_MOT" ] && LON_MOT=5 || true

echo $( awk "length(\$0)>$LON_MOT" "${DICO_FICHIER}" | shuf -n $NB_MOTS )
