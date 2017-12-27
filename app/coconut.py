
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app, debug, abort, error
import psycopg2
import functions
import urllib, hashlib
from beaker.middleware import SessionMiddleware

session_opts = {
    'session.type': 'memory',
    'session.cookie_expires': 1200,
    'session.auto': True
}

# Comment this line if you are using mod_wsgi & apache
app = SessionMiddleware(app(), session_opts)

# Login page
@route('/')
def index():
	return template('views/login.tpl')

@route('/newuser')
def newuser():
	return template('views/register.tpl')

@route('/register', method='POST')
def register():
 v_user = request.forms.get('user')
 usuarioexiste = functions.test_userexist(v_user)
 if usuarioexiste == None:
  v_password = request.forms.get('password')
  v_name = request.forms.get('name')
  v_mail = request.forms.get('mail')
  v_date = request.forms.get('date')
  v_ipmickey = request.forms.get('ipmickey')
  v_ipminnie = request.forms.get('ipminnie')
  v_ipdonald = request.forms.get('ipdonald')
  # Create and insert new user
  functions.addnewuser(v_user, v_password, v_name, v_mail, v_date, v_ipdonald, v_ipmickey, v_ipminnie)
 else:
  redirect('/')


# Do login
@route('/login', method='POST')
def login():
 # Request variables for login form
 v_user = request.forms.get('user')
 if v_user == None:
  abort(401, "Sorry, access denied.")
 else:
  v_password = request.forms.get('password')
  sql_query = "SELECT user_user, user_name, user_role FROM users WHERE user_user = '%s'" %(v_user)
  # Test if v_user can query his own data
  datosusuario = functions.test_connection(sql_query, v_user, v_password)
  if datosusuario is not None:
   # set session
   functions.setcoockie('s_user',v_user)
   functions.setcoockie('s_password',v_password)
   functions.setcoockie('s_name', datosusuario[1])
   functions.setcoockie('s_role', datosusuario[2])
   redirect('/dashboard')
  else:
   abort(401, "Sorry, access denied.")

# Main page
@route('/dashboard')
def dashboard():
 # Check session
 v_user = functions.getcoockie('s_user')
 if v_user == "":
  abort(401, "Sorry, access denied.")
 else:
  # Request session
  v_password = functions.getcoockie('s_password')
  v_name = functions.getcoockie('s_name')
  v_role = functions.getcoockie('s_role')
  # Last 5 backups query
  selectbackupusers="select backup_host, host_name, backup_user, to_char(backup_date, 'DD-MM-YYYY'), to_char(backup_date,'HH24:MI') from backups join hosts on host_ip = backup_host order by backup_date desc limit 5;"
  backupsusers=functions.selectall(selectbackupusers, v_user, v_password)
  # Stats querys & functions
  totalbackups="select count(backup_date) from backups;"
  sqlselectmode="select backup_mode, count(backup_host) from backups group by backup_mode;"
  sqlselecthosts="select h.host_name, count(b.backup_host) from backups b, hosts h where h.host_ip = b.backup_host group by h.host_name;"
  p_totalbackups=functions.database_select(totalbackups, v_user, v_password)
  backupsmode=functions.selectall(sqlselectmode, v_user, v_password)
  backupshost=functions.selectall(sqlselecthosts, v_user, v_password)
  total=int(p_totalbackups[0])
  # Gravatar function
  gravatar_url = functions.miniavatar(v_user,v_password)
  return template('views/index.tpl', user_user=v_user, user_name=v_name, user_urlimage=gravatar_url, backupsusers=backupsusers, total=total, modes=backupsmode, names=backupshost, rol=v_role)

# Profile path
@route('/profile')
def profile():
 # Check session
 v_user = functions.getcoockie('s_user')
 if v_user == "":
  abort(401, "Sorry, access denied.")
 else:
  # Request session
  v_password = functions.getcoockie('s_password')
  v_role = functions.getcoockie('s_role')
  # User data query
  sql_select="SELECT * FROM USERS WHERE user_user='%s'" %(v_user)
  campos=functions.database_select(sql_select, v_user, v_password)
  # Gravatar function
  gravatar_url = functions.miniavatar(v_user,v_password)
  return template('views/profile.tpl',  user_user=campos[0], user_name=campos[1], user_email=campos[2], user_date=campos[3], user_role=campos[4], user_urlimage=gravatar_url, rol=v_role)


# Backups list
@route('/backups', method=['get','post'])
def backups():
 # Check session
 v_user = functions.getcoockie('s_user')
 if v_user == "":
  abort(401, "Sorry, access denied.")
 else:
  # Request session
  v_password = functions.getcoockie('s_password')
  v_role = functions.getcoockie('s_role')
  print v_role
  # Filter role 1
  if str(v_role) in '1':
   print 'Soy profesor'
   v_fromdate = request.forms.get('date1')
   v_todate = request.forms.get('date2')
   v_hostname = request.forms.get('hostname')
   v_student = request.forms.get('students')
   print v_student
   print v_hostname
   selectallstudents="select user_name from users;"
   students=functions.selectall(selectallstudents, v_user, v_password)
   if v_student == "" or v_student == None:
    if v_hostname == "All" or v_hostname == None:
     if v_fromdate == None:
      sql_select="SELECT backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS'), host_owner, host_name FROM BACKUPS JOIN HOSTS ON host_ip = backup_host;"
     else:
      sql_select="select backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS'), host_owner, host_name FROM backups JOIN HOSTS ON host_ip = backup_host where backup_date between '%s 00:00:00' and '%s 23:59:59' order by backup_date desc;" %(v_fromdate, v_todate)
    else:
     sql_select="select backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS'), host_owner, host_name FROM backups JOIN HOSTS ON host_ip = backup_host where backup_date between '%s 00:00:00' and '%s 23:59:59' and backup_host in (select host_ip from hosts where host_name = '%s') order by backup_date desc;" %(v_fromdate, v_todate, v_hostname)
   else:
    if v_hostname == "All" or v_hostname == None:
     if v_fromdate == None:
      sql_select="SELECT backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS'), host_owner, host_name FROM BACKUPS JOIN HOSTS ON host_ip = backup_host where backup_user = '%s';" %(v_student)
     else:
      sql_select="select backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS'), host_owner, host_name from backups JOIN HOSTS ON host_ip = backup_host where backup_date between '%s 00:00:00' and '%s 23:59:59' and backup_user = (select user_user from users where user_name = '%s') order by backup_date desc;" %(v_fromdate, v_todate, v_student)
    else:
     sql_select="select backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS'), host_owner, host_name from backups JOIN HOSTS ON host_ip = backup_host where backup_date between '%s 00:00:00' and '%s 23:59:59' and backup_host = (select host_ip from hosts where host_owner = (select user_user from users where user_name = '%s') and host_name = '%s') order by backup_date desc;" %(v_fromdate, v_todate, v_student, v_hostname)
   campos = functions.selectall(sql_select, v_user, v_password)
   gravatar_url = functions.miniavatar(v_user,v_password)
   return template('views/backups.tpl', students=students, user_user=v_user, user_urlimage=gravatar_url, backups=campos, rol=v_role)
  else:
   v_fromdate = request.forms.get('date1')
   v_todate = request.forms.get('date2')
   v_host = request.forms.get('host')
   # Filter querys
   if v_host == "" or v_host == None:
    if v_fromdate == None:
     sql_select="SELECT backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS') FROM BACKUPS WHERE backup_user='%s'" %(v_user)
    else:
     sql_select="select backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS') from backups where backup_date between '%s 00:00:00' and '%s 23:59:59' and backup_user = '%s' order by backup_date desc;" %(v_fromdate, v_todate, v_user)
   else:
    sql_select="select backup_host, backup_label, backup_description, backup_mode, to_char(backup_date, 'DD-MM-YYYY HH24:MI:SS') from backups where backup_date between '%s 00:00:00' and '%s 23:59:59' and backup_host = (select host_ip from hosts where host_owner = '%s' and host_ip = '%s') order by backup_date desc;" %(v_fromdate, v_todate, v_user, v_host)
   # Filter function
   campos=functions.selectall(sql_select, v_user, v_password)
   # Gravatar function
   gravatar_url = functions.miniavatar(v_user,v_password)
   return template('views/backups.tpl', backups=campos, user_user=v_user, user_urlimage=gravatar_url, rol=v_role)

# New Backup forms
@route('/newbackup')
def newbackup():
 # Check session
 v_user = functions.getcoockie('s_user')
 if v_user == "":
  abort(401, "Sorry, access denied.")
 else:
  # Request session
  v_password = functions.getcoockie('s_password')
  v_role = functions.getcoockie('s_role')
  # Host list query & function
  sql_select="select host_ip from hosts where host_owner  = '%s';" %(v_user)
  campos=functions.selectall(sql_select, v_user, v_password)
  # Gravatar function
  gravatar_url = functions.miniavatar(v_user,v_password)
  return template('views/newbackup.tpl', user_user=v_user, hosts=campos, user_urlimage=gravatar_url, rol=v_role)

# Insert new backups
@route('/insert', method='POST')
def insertbackup():
 # Check session
 v_user = functions.getcoockie('s_user')
 if v_user == "":
  abort(401, "Sorry, access denied.")
 else:
  # Request session
  v_password = functions.getcoockie('s_password')
  # Request vars from newbackup form
  v_label = request.forms.get('label')
  v_ip = request.forms.get('ip')
  v_desc = request.forms.get('desc')
  # Insert new backup query & function
  sql_insert="insert into backups (backup_user, backup_host, backup_label, backup_description, backup_mode) values ('%s','%s','%s','%s','%s');" %(v_user, v_ip, v_label, v_desc, 'Manual')
  functions.database_insert(sql_insert, v_user, v_password)
  redirect('/backups')

# Stats
@route('/stats')
def stats():
 v_user = functions.getcoockie('s_user')
 if v_user == "":
  abort(401, "Sorry, access denied.")
 else:
  v_password = functions.getcoockie('s_password')
  totalbackups="select count(backup_date) from backups;"
  sqlselectmode="select backup_mode, count(backup_host) from backups group by backup_mode;"
  sqlselecthosts="select h.host_name, count(b.backup_host) from backups b, hosts h where h.host_ip = b.backup_host group by h.host_name;"
  p_totalbackups=functions.database_select(totalbackups, v_user, v_password)
  backupsmode=functions.selectall(sqlselectmode, v_user, v_password)
  backupshost=functions.selectall(sqlselecthosts, v_user, v_password)
  total=int(p_totalbackups[0])
  gravatar_url = functions.miniavatar(v_user,v_password)
  return template('views/stats.tpl', user_user=v_user, user_urlimage=gravatar_url, total=total, modes=backupsmode, names=backupshost)

# Do logout
@route('/logout')
def logout():
 functions.deletecoockie()
 redirect('/')

# Static files
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

# error handlers
@error(404)
def error404(error):
    return template('views/error/404.tpl')
@error(401)
def error401(error):
    return template('views/error/401.tpl')

# Comment this if you are using mod_wsgi & apache
debug(True)
run(app=app, host = '0.0.0.0', port = 8080)
