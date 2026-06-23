#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="D"

# ---
clear
echo "Ansible: "
cat ../ansible/playbook.yml
echo 

# --- Comandos usados:
echo
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_D${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_D${PUNTO}.sh
echo "-------------------------------------------------------------"
echo
