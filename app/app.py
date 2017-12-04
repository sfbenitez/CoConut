
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app, debug
import bottle_session
import psycopg2
from functions import selectall,database_select

# Inicialize the sessions plugin
app = app()
plugin = bottle_session.SessionPlugin(cookie_lifetime=600)
app.install(plugin)

@route('/')
def index():
	return template('login.tpl')

@route('/dashboard', method='POST')
def dashboard():
	user = request.forms.get('user')
	password = request.forms.get('password')
	if user != "":
		response.set_cookie('username', user, path='/')
	else:
		return template('login.tpl')
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
	return template('views/index.tpl', user_user=campos[0], user_name=campos[1], user_urlimage=campos[5])

@route('/profile/:user', method='GET')
def profile(user):
	sql_select="SELECT * FROM USERS WHERE user_user='%s'" %(user)
	campos=database_select(sql_select)
	return template('views/profile.tpl',  user_user=campos[0], user_name=campos[1], user_email=campos[2], user_date=campos[3], user_role=campos[4], user_urlimage=campos[5])
	user=user
	response.set_cookie('usuario', user)
#	sql_select='SELECT * FROM USERS'
#    campos=database_select(sql_select)

#    return template('index.tpl',  user_user=campos[0], user_name=campos[1])
@route('/backups/:user', method='GET')
def backups(user):
	sql_select="SELECT backup_host, backup_label, backup_description, backup_action, to_char(backup_date, 'YYYY-MM-DD HH24:MI:SS') FROM BACKUPS WHERE backup_user='%s'" %(user)
	campos=selectall(sql_select)
	return template('views/backups.tpl', backups=campos,user_user=campos[0][0])

@route('/newcopy/:user', method='POST')
def newcopy(user):
	r = request.get_cookie('username')
	return template('views/newcopy.tpl', user_user=r)

# Static files
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

debug(True)
run(app=app, host = '0.0.0.0', port = 8080)
