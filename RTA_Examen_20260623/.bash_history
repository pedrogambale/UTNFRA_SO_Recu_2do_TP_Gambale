sudo apt update
sudo apt install -y git tree ansible docker.io docker-compose
git clone https://github.com/sofiasartori/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202411/script_Precondicion.sh
source  ~/.bashrc  && history -a
#!/bin/bash
mkdir -p ~/RTA_Examen_$(date +%Y%m%d)
cat << 'EOF' > ~/RTA_Examen_$(date +%Y%m%d)/Punto_A.sh
#!/bin/bash
sudo pvcreate /dev/sdb /dev/sdc
sudo vgcreate vg_datos /dev/sdb /dev/sdc
sudo lvcreate -L 512M vg_datos -n lv_docker
sudo lvcreate -L 1.5G vg_datos -n lv_multimedia
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_multimedia
sudo mkdir -p /var/lib/docker
sudo mkdir -p /Multimedia
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_multimedia /Multimedia
sudo mkswap /dev/sdc1
sudo swapon /dev/sdc1
EOF

chmod +x ~/RTA_Examen_$(date +%Y%m%d)/Punto_A.sh
sudo ~/RTA_Examen_$(date +%Y%m%d)/Punto_A.sh
df -h | grep -E 'docker|Multimedia'
sudo mkdir -p /Multimedia
sudo mount /dev/vg_datos/lv_multimedia /Multimedia
sudo mkdir -p /Multimedia
sudo mount /dev/vg_datos/lv_multimedia /Multimedia
df -h | grep -E 'docker|Multimedia'
sudo lvcreate -l +100%FREE vg_datos -n lv_multimedia
sudo mkfs.ext4 /dev/vg_datos/lv_multimedia
sudo mount /dev/vg_datos/lv_multimedia /Multimedia
df -h | grep -E 'docker|Multimedia'
chmod +x ~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
ls -R /tmp/Animales
mkdir -p /tmp/Animales
cat << 'EOF' > /tmp/Animales/animales.txt
Animal,Clasificacion,Tipo
Leon,Vertebrados,Mamiferos
Aguila,Vertebrados,Aves
Salmon,Vertebrados,Peces
Cocodrilo,Vertebrados,Reptiles
Lombriz,Invertebrados,Anelidos
Mariposa,Invertebrados,Insectos
EOF

~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
ls -R /tmp/Animales
chmod +x ~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
ls -R /tmp/Animales
cat << 'EOF' > ~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
ARCHIVO_ANIMALES="/tmp/Animales/animales.txt"
DIR_BASE="/tmp/Animales"

if [ ! -f "$ARCHIVO_ANIMALES" ]; then
    echo "Error: El archivo $ARCHIVO_ANIMALES no existe."
    exit 1
fi

while IFS=',' read -r animal clasificacion tipo || [ -n "$animal" ]; do
    # Limpiar espacios y caracteres ocultos
    animal=$(echo "$animal" | tr -d '\r' | xargs)
    clasificacion=$(echo "$clasificacion" | tr -d '\r' | xargs)
    tipo=$(echo "$tipo" | tr -d '\r' | xargs)

    if [[ "$animal" == "Animal" || -z "$animal" ]]; then
        continue
    fi

    DIR_DESTINO="$DIR_BASE/$clasificacion/$tipo"
    mkdir -p "$DIR_DESTINO"

    echo "Clasificación: $clasificacion, Tipo: $tipo" > "$DIR_DESTINO/$animal.txt"
done < "$ARCHIVO_ANIMALES"

echo "Clasificación de animales completada con éxito."
EOF

chmod +x ~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
~/RTA_Examen_$(date +%Y%m%d)/Punto_B.sh
ls -R /tmp/Animales
sudo mkdir -p /usr/local/bin
cat << 'EOF' | sudo tee /usr/local/bin/pedrogambale_clasif_animales.sh > /dev/null
EOF

sudo mkdir -p /usr/local/bin
cd /home/pedropgambale/UTN-FRA_SO_Examenes/202411/docker/
docker build -t pedrogambale/web2-gambale:latest .
ls -la
ls -la web/
cat << EOF > Dockerfile
FROM nginx:alpine
COPY web /usr/share/nginx/html
EOF

ls -la
docker build -t pedrogambale/web2-gambale:latest .
sudo docker build -t pedrogambale/web2-gambale:latest .
sudo systemctl restart docker
sudo systemctl status docker
sudo docker build -t pedrogambale/web2-gambale:latest .
sudo docker push pedrogambale/web2-gambale:latest
sudo docker login
sudo docker push pedrogambale/web2-gambale:latest
sudo docker compose up -d
sudo docker-compose up -d
cat << EOF > docker-compose.yml
version: '3.8'
services:
  web:
    image: pedropgambale/web2-gambale:latest
    ports:
      - "81:80"
    volumes:
      - ./web:/usr/share/nginx/html
EOF

sudo docker-compose up -d
cat << EOF > docker-compose.yml
version: '3.8'
services:
  web:
    image: pedropgambale/web2-gambale:latest
    build: .
    ports:
      - "81:80"
    volumes:
      - ./web:/usr/share/nginx/html
EOF

sudo docker-compose up -d --build
sudo docker ps
cd ~/UTN-FRA_SO_Examenes/202411/ansible/
ls -la
ls -l roles/
cat << EOF > playbook.yml
- hosts: all
  become: yes
  roles:
    - 2PRecuperatorio
EOF

cat << EOF > roles/2PRecuperatorio/tasks/main.yml
- name: Crear carpeta de trabajo
  file:
    path: /tmp/practica_so
    state: directory
    owner: pedropgambale
    group: pedropgambale
    mode: '0755'

- name: Configurar sudoers para el usuario
  lineinfile:
    path: /etc/sudoers
    state: present
    regexp: '^pedropgambale'
    line: 'pedropgambale ALL=(ALL) NOPASSWD: ALL'
    validate: '/usr/sbin/visudo -cf %s'
EOF

ansible-playbook -i inventory/hosts playbook.yml
ls -ld /tmp/practica_so
sudo whoami
cd ~
mkdir -p RTA_Examen_20260623
cp -r ~/UTN-FRA_SO_Examenes/202411/ .
history -a
cp ~/.bash_history RTA_Examen_20260623/
cd UTNFRA_SO_Recu_2do_TP_Gambale
mkdir ~/UTNFRA_SO_Recu_2do_TP_Gambale
cd ~/UTNFRA_SO_Recu_2do_TP_Gambale
git init
mkdir RTA_Examen_20260623
cp -r ~/UTN-FRA_SO_Examenes/202411 .
history -a
