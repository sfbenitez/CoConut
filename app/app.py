
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app, debug
import bottle_session
import psycopg2
from functions import selectall,database_select

session_opts = {
    'session.type': 'memory',
    'session.cookie_expires': 600,
    #'session.data_dir': './data',
    'session.auto': True
}
app = SessionMiddleware(app(), session_opts)


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

#@route('/')
#def index():
	# Request variables
#	user = request.forms.get('user')
#	password = request.forms.get('password')
#	constring='dbname=db_backup host=172.22.200.110 user=%s password=%s' %(user,password)
#	try:
#		conectado=psycopg2.connect(connstring)
#		sesion.set("user",user)
#	except:#
    	#return template('login.tpl')
	#return redirect('/dashboard')


@route('/dashboard', method='POST')
def dashboard():

	#sql_select="select count(host_name), backup_user from hosts, backups where host_ip = backup_host and backup_user = '%s' group by backup_user;" %(user)
	sql_select = "select * from users;"
	campos=database_select(sql_select)
	#return template('dashboard.tpl', numbackups=campos[0], maquina=campos[1], user_user=user)
	return template('views/index.tpl', user_user=campos[0], user_name=campos[1], user_urlimage=campos[5])

#@route('/login',method="post")
#def do_login():


@route('/profile')
def profile():
	sql_select="SELECT * FROM USERS WHERE user_user='%s'" %(user)
	campos=database_select(sql_select)
	return template('views/profile.tpl',  user_user=campos[0], user_name=campos[1], user_email=campos[2], user_date=campos[3], user_role=campos[4], user_urlimage=campos[5])
	user=user
	response.set_cookie('usuario', user)
#	sql_select='SELECT * FROM USERS'
#    campos=database_select(sql_select)

#    return template('index.tpl',  user_user=campos[0], user_name=campos[1])
@route('/backups')
def backups():
	sql_select="SELECT backup_host, backup_label, backup_description, backup_action, to_char(backup_date, 'YYYY-MM-DD HH24:MI:SS') FROM BACKUPS WHERE backup_user='%s'" %(user)
	campos=selectall(sql_select)
	return template('views/backups.tpl', backups=campos,user_user=campos[0][0])

@route('/newbackup')
def newbackup(user):
	return template('views/new')

# Static files
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

debug(True)
run(app=app, host = '0.0.0.0', port = 8080)
