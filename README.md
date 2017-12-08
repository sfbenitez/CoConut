# CoConut

Aplicación para llevar un seguimiento de las copias de seguridad realizadas por los alumnos de 2º ASIR del I.E.S Gonzalo Nazareno, escrita en python y que hace uso de una base de datos postGreSQL.

## Vista previa

![](http://www.charliejsanchez.com/wp-content/uploads/2017/12/example.jpg)

### Autores
Created by @sfbenitez & @carlosjsanch3z

## Despliegue en un servidor Apache2 con módulo WSGI.

### Creación del servidor virtual

``` [apache]
<VirtualHost *>
    ServerName coconut.ferrete.gonzalonazareno.org
    DocumentRoot /var/www/coconut
    WSGIDaemonProcess coconut user=www-data group=www-data python-home=/home/debian/venv python-path=/var/www/coconut
    WSGIProcessGroup coconut
    WSGIApplicationGroup %{GLOBAL}
    WSGIScriptAlias / /var/www/coconut/coconut.wsgi
    <Directory /var/www/coconut/>
	Require all granted
	<Files coconut.wsgi>
		Require all granted
	</Files>
   </Directory>

</VirtualHost>
```
