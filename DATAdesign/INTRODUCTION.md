## Instalación PostgreSQL testBACKUAPP ##

~~~
apt-update
apt install postgresql-9.6
~~~

##### Paquetes adicionales:

- libpq5
- libsensors4
- libxslt1.1
- postgresql-client-9.6
- postgresql-client-common
- postgresql-common
- postgresql-contrib-9.6
- ssl-cert sysstat


### Permitir el inicio de manera local para los nuevos usuarios, sustituyendo "peer" por "md5":

postgres@server:~$ nano /etc/postgresql/9.6/main/pg_hba.conf

~~~
local   all             all                                              md5
host    all             all              0.0.0.0/0                       md5
~~~

### Habilitar conexiones remotas

postgres@server:~$ nano /etc/postgresql/9.6/main/postgresql.conf

~~~
listen_addresses = '*'
~~~

root@server:/home/vagrant# systemctl restart postgresql

### Iniciar sesion con el superuser

~~~
root@server:/home/vagrant# su - postgres
postgres@server:~$ psql
~~~

### Crear un usuario especifico para la nueva base de datos

~~~
CREATE ROLE admin PASSWORD 'admin' CREATEDB CREATEROLE INHERIT LOGIN;
~~~

### Crear una nueva base de DATOS

~~~
CREATE DATABASE  db_backup;
ALTER DATABASE db_backup OWNER TO admin;
~~~

### Iniciar sesion con el usuario admin y crear las tablas

~~~
postgres@server:~$ psql -U admin db_backup
~~~

### Crear un nuevo rol y darle los privilegios sobre las tablas

~~~
CREATE ROLE pupilgroup;
GRANT SELECT,UPDATE,INSERT ON ALL TABLES IN SCHEMA public TO pupilgroup;
~~~


### Example new user

~~~
CREATE USER "carlos.sanchez" PASSWORD 'usuario' IN ROLE pupilgroup;
~~~

### Para revocar los permisos:

~~~
REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM pupilgroup;
~~~
