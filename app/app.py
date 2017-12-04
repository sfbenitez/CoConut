
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app, debug
import bottle_session
import psycopg2
import functions
import urllib, hashlib
from beaker.middleware import SessionMiddleware

session_opts = {
    'session.type': 'memory',
    'session.cookie_expires': 600,
    'session.auto': True
}
app = SessionMiddleware(app(), session_opts)

# Login page
@route('/')
def index():
	return template('views/login.tpl')

@route('/login', method='POST')
def login():
 # Request variables
 v_user = request.forms.get('user')
 v_password = request.forms.get('password')
 sql_query = "SELECT user_user FROM users WHERE user_user = '%s'" %(v_user)
 if functions.test_connection(sql_query, v_user, v_password):
  functions.set('s_user',v_user)
  functions.set('s_password',v_password)
  redirect('/dashboard')
 else:
  return template('views/logout.tpl')

# Main page
@route('/dashboard')
def dashboard():
 v_user = functions.get('s_user')
 v_password = functions.get('s_password')
 #sql_select="select count(host_name), backup_user from hosts, backups where host_ip = backup_host and backup_user = '%s' group by backup_user;" %(user)
 sql_select = "select * from users where user_user = '%s';" %(v_user)
 campos=functions.database_select(sql_select, v_user, v_password)
 gravatar_url = functions.miniavatar(v_user,v_password)
 return template('views/index.tpl', user_user=campos[0], user_name=campos[1], user_urlimage=gravatar_url)

# Profile path
@route('/profile')
def profile():
 v_user = functions.get('s_user')
 v_password = functions.get('s_password')
 sql_select="SELECT * FROM USERS WHERE user_user='%s'" %(v_user)
 campos=functions.database_select(sql_select, v_user, v_password)
 gravatar_url = functions.miniavatar(v_user,v_password)
 return template('views/profile.tpl',  user_user=campos[0], user_name=campos[1], user_email=campos[2], user_date=campos[3], user_role=campos[4], user_urlimage=gravatar_url)

# Backups list
@route('/backups')
def backups():
 v_user = functions.get('s_user')
 v_password = functions.get('s_password')
 sql_select="SELECT backup_host, backup_label, backup_description, backup_action, to_char(backup_date, 'YYYY-MM-DD HH24:MI:SS') FROM BACKUPS WHERE backup_user='%s'" %(v_user)
 campos=functions.selectall(sql_select, v_user, v_password)
 gravatar_url = functions.miniavatar(v_user,v_password)
 return template('views/backups.tpl', backups=campos, user_user=v_user, user_urlimage=gravatar_url)

# New Backup forms
@route('/newbackup')
def newbackup():
 v_user = functions.get('s_user')
 v_password = functions.get('s_password')
 gravatar_url = functions.miniavatar(v_user,v_password)
 sql_select="select host_ip, host_name from hosts where host_ip in (select host_ip from hostsowners where user_user = '%s')" %(v_user)
 campos==functions.selectall(sql_select, v_user, v_password)
 return template('views/newbackup.tpl', user_user=v_user, hosts=campos, user_urlimage=gravatar_url)

#@route('/insert')
#def insertbackup():
# v_user = functions.get('s_user')
# v_label = request.forms.get('label')
# v_password = request.forms.get('password')

# Static files
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

debug(True)
run(app=app, host = '0.0.0.0', port = 8080)
