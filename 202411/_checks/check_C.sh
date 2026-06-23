#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="C"

# ---
clear
echo "Docker"
docker ps
echo 
curl localhost:81
echo 

# --- Comandos usados:
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_C${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_C${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
