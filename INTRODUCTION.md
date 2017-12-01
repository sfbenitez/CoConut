## Instalación PostgreSQL testBACKUAPP ##

apt-update
apt install postgresql-9.6

Paquetes adicionales: libpq5 libsensors4 libxslt1.1 postgresql-client-9.6 postgresql-client-common postgresql-common
postgresql-contrib-9.6 ssl-cert sysstat


## Permitir el inicio de manera local para los nuevos usuarios, sustituyendo "peer" por "md5":
postgres@kenny:~$ nano /etc/postgresql/9.6/main/pg_hba.conf

local   all             all                                     md5

root@kenny:/home/vagrant# systemctl restart postgresql

## Iniciar sesion con el superuser
root@kenny:/home/vagrant# su - postgres
postgres@kenny:~$ psql

## Crear un usuario especifico para la nueva base de datos
CREATE ROLE admin PASSWORD 'admin' CREATEDB CREATEROLE INHERIT LOGIN;

## Crear una nueva base de DATOS
CREATE DATABASE  db_backup;
ALTER DATABASE db_backup OWNER TO admin;

## Iniciar sesion con el usuaro admin y crear las tablas:
postgres@kenny:~$ psql -U admin db_backup
