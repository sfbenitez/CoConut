import os
import psycopg2
from bottle import request, redirect, template
from beaker.middleware import SessionMiddleware
import urllib, hashlib

def test_connection(sql_query, user, password):
 cur = None
 connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(user, password)
 # try:
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
 # except Exception, e:
 #     redirect('/')


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


def set(key,value):
 s = request.environ.get('beaker.session')
 s[key]=value

def get(key):
 s = request.environ.get('beaker.session')
 if key in s:
  return s[key]
 else:
  return ""

def delete():
 s = request.environ.get('beaker.session')
 s.delete()
