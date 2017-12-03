
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app, debug
import bottle_session
import psycopg2

# Inicialize the sessions plugin
app = app()
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
	#connstring = request.get_cookie('concoockie')
	connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %('sergio.ferrete', 'usuario')
	#connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(user, password)
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
	return template('login.tpl')

@route('/dashboard', method='POST')
def dashboard():
	# Request variables
	user = request.forms.get('user')
 	password = request.forms.get('password')
	ip = request.environ.get('REMOTE_ADDR')
	# Connection string
	connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(user,password)
	# Saving connstring
	#response.set_cookie('concoockie', connstring)
	# Iniciating session
	#try:
		# DB conenction
	#sql_select="select count(host_name), backup_user from hosts, backups where host_ip = backup_host and backup_user = '%s' group by backup_user;" %(user)
	sql_select = "select * from users;"
	campos=database_select(sql_select)

	#except:
	#	return template('login.tpl')
	#return template('dashboard.tpl', numbackups=campos[0], maquina=campos[1], user_user=user)
	return template('views/index.tpl', user_user=campos[0], user_name=campos[1], tittle = "Prueba", ip = ip)

@route('/profile/:user', method='GET')
def profile(user):
	sql_select="SELECT * FROM USERS WHERE user_user='%s'" %(user)
	campos=database_select(sql_select)
	return template('views/profile.tpl',  user_user=campos[0], user_name=campos[1], user_email=campos[2], user_date=campos[3], user_role=campos[4], user_urlimage=campos[5])

#	sql_select='SELECT * FROM USERS'
#    campos=database_select(sql_select)

#    return template('index.tpl',  user_user=campos[0], user_name=campos[1])

# Static files
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

debug(True)
run(app=app, host = '0.0.0.0', port = 8080, reloader=True)
