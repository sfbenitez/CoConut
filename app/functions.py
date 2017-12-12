import os
import psycopg2
from bottle import request, redirect, template, abort
from beaker.middleware import SessionMiddleware
import urllib, hashlib

def test_connection(sql_query, user, password):
 cur = None
 connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(user, password)
 try:
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
   else:
    redirect('/')
  return resultado
 except Exception, e:
  abort(401, "Sorry, acces denied.")


def selectall(sql_query, v_user, v_password):
 cur = None
 connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(v_user, v_password)
 try:
  connect = psycopg2.connect(connstring)
  print sql_query
  try:
   cur = connect.cursor()
   cur.execute(sql_query)
   resultado = cur.fetchall()
  except:
   print sql_query
  finally:
   if cur is not None:
    cur.close()
  return resultado
 except Exception, e:
  return template('views/login.tpl')

def database_select(sql_query, v_user, v_password):
 cur = None
 connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(v_user, v_password)
 try:
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
   else:
    return "";
  return resultado
 except Exception , e:
  return template('views/login.tpl')



def database_insert(sql_query, v_user, v_password):
 cur = None
 connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(v_user, v_password)
 try:
  connect = psycopg2.connect(connstring)
  print sql_query
  try:
   cur = connect.cursor()
   cur.execute(sql_query)
   resultado = cur.statusmessage
   connect.commit()
  except Exception , e:
   print 'ERROR:', e[0]
   if cur is not None:
    connect.rollback()
  finally:
   if cur is not None:
    cur.close()
  return cur.statusmessage
 except Exception, e:
  return template('views/login.tpl')

def test_userexist(user):
 cur = None
 v_useradmin = 'admin'
 v_passwordadmin = 'admin1234'
 v_hostdb = '172.22.200.110'
 v_db = 'db_backup'
 connstring = 'dbname=%s host=%s user=%s password=%s' %(v_db, v_hostdb, v_useradmin, v_passwordadmin)
 sql_query = "SELECT user_user FROM users WHERE user_user = '%s'" %(user)
 try:
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
   else:
    redirect('/')
  return resultado
 except Exception, e:
  abort(401, "Sorry, acces denied.")

def addnewuser(v_user, v_password, v_name, v_mail, v_date, v_ipdonald, v_ipmickey, v_ipminnie):
 newuser_createrole(v_user, v_password)
 newuser_insertuser(v_user, v_name, v_mail, v_date)
 newuser_insertmaquina(v_user, v_ipmickey, 'Mickey')
 newuser_insertmaquina(v_user, v_ipminnie, 'Minnie')
 newuser_insertmaquina(v_user, v_ipdonald, 'Donald')
 setcoockie('s_user',v_user)
 setcoockie('s_password',v_password)
 setcoockie('s_name', v_name)
 redirect('/dashboard')

def newuser_createrole(v_user, v_password):
 cur = None
 v_useradmin = 'admin'
 v_passwordadmin = 'admin1234'
 v_hostdb = '172.22.200.110'
 v_db = 'db_backup'
 connstring = "dbname=%s host=%s user=%s password=%s" %(v_db, v_hostdb, v_useradmin, v_passwordadmin)
 createrole = "create role \"%s\" password '%s' login in role pupilgroup;" %(v_user, v_password)
 try:
  connect = psycopg2.connect(connstring)
  print createrole
  try:
   cur = connect.cursor()
   cur.execute(createrole)
   resultado = cur.statusmessage
   connect.commit()
  except Exception , e:
   print 'ERROR:', e[0]
   if cur is not None:
    connect.rollback()
  return cur.statusmessage
 except Exception, e:
  return template('views/login.tpl')

def newuser_insertuser(v_user, v_name, v_mail, v_date ):
 cur = None
 v_useradmin = 'admin'
 v_passwordadmin = 'admin1234'
 v_hostdb = '172.22.200.110'
 v_db = 'db_backup'
 connstring = "dbname=%s host=%s user=%s password=%s" %(v_db, v_hostdb, v_useradmin, v_passwordadmin)
 adduser = "insert into users values ('%s', '%s', '%s', to_date('%s', 'DD/MM/YYYY'), '%s');" %(v_user, v_name, v_mail, v_date, '2')
 try:
  connect = psycopg2.connect(connstring)
  print adduser
  try:
   cur = connect.cursor()
   cur.execute(adduser)
   resultado = cur.statusmessage
   connect.commit()
  except Exception , e:
   print 'ERROR:', e[0]
   if cur is not None:
    connect.rollback()
  return cur.statusmessage
 except Exception, e:
  return template('views/login.tpl')

def newuser_insertmaquina(v_user, v_ip, v_nombremaquina):
 cur = None
 v_useradmin = 'admin'
 v_passwordadmin = 'admin1234'
 v_hostdb = '172.22.200.110'
 v_db = 'db_backup'
 connstring = "dbname=%s host=%s user=%s password=%s" %(v_db, v_hostdb, v_useradmin, v_passwordadmin)
 insertmaquina = "insert into hosts values ('%s', '%s', '%s')" %(v_ip, v_nombremaquina, v_user)
 try:
  connect = psycopg2.connect(connstring)
  print insertmaquina
  try:
   cur = connect.cursor()
   cur.execute(insertmaquina)
   resultado = cur.statusmessage
   connect.commit()
  except Exception , e:
   print 'ERROR:', e[0]
   if cur is not None:
    connect.rollback()
  return cur.statusmessage
 except Exception, e:
  return template('views/login.tpl')

def miniavatar(v_user, v_password):
 sql_query="select user_email from users where user_user = '%s'" %(v_user)
 consulta=database_select(sql_query, v_user, v_password)
 email=consulta[0]
 if email is not None:
  default = "default.jpg"
  size = 512
  gravatar_url = "https://www.gravatar.com/avatar/" + hashlib.md5(email.lower()).hexdigest() + "?"
  gravatar_url += urllib.urlencode({'d':default, 's':str(size)})
  return gravatar_url
 else:
  return "http://www.charliejsanchez.com/wp-content/uploads/2017/12/default.jpg"


def setcoockie(key, value):
 # session = environ['beaker.session']
 s = request.environ['beaker.session']
 s[key]=value

def getcoockie(key):
 s = request.environ['beaker.session']
 if key in s:
  return s[key]
 else:
  abort(401, "Sorry, acces denied.")

def deletecoockie():
 s = request.environ['beaker.session']
 s.delete()
