#!/bin/bash

echo "Removendo diretórios caso existam..."

rm -f -R /publico
rm -f -R /adm
rm -f -R /ven
rm -f -R /sec

echo "Fim Remove diretorios"

echo "Removendo usuários..."

userdel -r  carlos
userdel -r  maria 
userdel -r  joao 
userdel -r  debora 
userdel -r  sebastiana 
userdel -r  roberto 
userdel -r  josefina 
userdel -r  amanda 
userdel -r  rogerio 

echo "Fim Remove usuario"

echo "Removendo grupos de usuários..."

groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Fim Remove grupo"

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Fim cria diretorios"

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Fim cria grupos"

echo "Criando usuários..."

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Fim cria usuarios"

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim....."

