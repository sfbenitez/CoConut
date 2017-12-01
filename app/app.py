
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app
import bottle_session
import psycopg2

# Inicialize the sessions plugin
app = bottle.app()
plugin = bottle_session.SessionPlugin(cookie_lifetime=600)
app.install(plugin)


#def database_insert(sql_query):
#	cur = None
#	print sql_query
#	try:
#		cur = conn.cursor()
#		cur.execute(sql_query)
#		resultado = cur.statusmessage
#		conn.commit()
#	except Exception , e:
#		print 'ERROR:', e[0]
#		if cur is not None:
#			conn.rollback()
#	finally:
#		if cur is not None:
#			cur.close()#
#    return cur.statusmessage

def database_select(sql_query):
	cur = None
	connstring = request.get_cookie('concookie')
	connect = psycopg2.connect(connstring)
	print sql_query
	try:
		cur = connect.cursor()
		cur.execute(sql_query)
		resultado = cur.fetchone()
	except:
		return false
	finally:
		if cur is not None:
			cur.close()
	return resultado

@route('/')
def index():
	return template("login.tpl")

@route('/dashboard', method='POST')
def dashboard():
	# Request variables
	user = request.forms.get('user')
 	password = request.forms.get('password')
	# Connection string
	connstring = "dbname=db_backup host=172.22.2.205 user="+str(user)+" password="+str(password)
	# Iniciating session
	session['name'] = user
	try:
		# DB conenction
		sql_select="SELECT default_name, count(backup_date) FROM hosts h, backups b, defaultnames d where h.host_name = d.default_id and host_ip = backup_host and backup_user = "+user+" group by default_name;"
		campos=database_select(sql_select)
		# Saving connstring
		response.set_cookie('concoockie', connstring)
	except:
		return template("logout.tpl")
	return template("dashboard.tpl", maquina=campos[0], numbackups=campos[1], user = user)

@route('/profile', method='POST')
def profile(session):
	user_name = session.get('name'):
	sql_select="SELECT * FROM USERS WHERE user_user="+user_name
    campos=database_select(sql_select)
	return template("profile.tpl",  user_user=campos[0], user_name=campos[1], user_email=campos[2], user_date=campos[3], user_role=campos[4], user_urlimage=campos[5])


#	sql_select="SELECT * FROM USERS"
#    campos=database_select(sql_select)

#    return template("index.tpl",  user_user=campos[0], user_name=campos[1])

# Static files
@route('/static/<filename>')
def server_static(filename):
	return static_file(filename, root='/static/')

debug(True)
run(app=app, host = '0.0.0.0', port = 8080)
