# CoConut

Aplicación para llevar un seguimiento de las copias de seguridad realizadas por los alumnos de 2º ASIR del I.E.S Gonzalo Nazareno, escrita en python y que hace uso de una base de datos postGreSQL.

## Vista previa

![](http://www.charliejsanchez.com/wp-content/uploads/2017/12/example.jpg)

Created by @sfbenitez & @carlosjsanch3z

## Despliegue en un servidor Apache2 con módulo WSGI.

### Creación del servidor virtual

``` [apache]
<VirtualHost *>
    ServerName coconut.ferrete.gonzalonazareno.org
    DocumentRoot /var/www/coconut
    WSGIDaemonProcess coconut user=www-data group=www-data python-home=/home/debian/venv python-path=/var/www/coconut
    WSGIProcessGroup coconut
    WSGIScriptAlias / /var/www/coconut/coconut.wsgi
    <Directory /var/www/coconut/>
	Require all granted
	<Files coconut.wsgi>
		Require all granted
	</Files>
   </Directory>
</VirtualHost>
```
### Instalación de los requisitos
Con el entorno virtual activado.

* Actualizar pip
`pip install -U pip`
* Instalar requisitos
`pip install -r requisites.txt`

### Creación del fichero wsgi
El fichero wsgi deberá estar en el mismo directorio que la aplicación.

``` [python]
import sys, os, bottle
import beaker.middleware

import coconut # Import coconut.py

sys.path = ['/var/www/coconut/'] + sys.path
os.chdir(os.path.dirname(__file__))

# Inicialice app with SessionMiddleware environ
application = beaker.middleware.SessionMiddleware(bottle.default_app(), coconut.session_opts)
```
### Comentar función run() y app() dentro de coconut.py
``` [python]
#app = SessionMiddleware(app(), session_opts)
#debug(True) # Desactivar Debug en entorno de producción
#run(app=app, host = '0.0.0.0', port = 8080)
```
