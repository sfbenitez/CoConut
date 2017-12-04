import os
import psycopg2
from bottle import request

def selectall(sql_query):
	cur = None
	connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %('sergio.ferrete', 'usuario')
	#connstring = 'dbname=db_backup host=172.22.200.110 user=%s password=%s' %(user, password)
	connect = psycopg2.connect(connstring)
	print sql_query
	try:
		cur = connect.cursor()
		cur.execute(sql_query)
		resultado = cur.fetchall()
	except:
		return false
	finally:
		if cur is not None:
			cur.close()
	return resultado

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

def set(key,value):
	s = request.environ.get('beaker.session')

	s[key]=value

def get(key):
	s = request.environ.get('beaker.session')

	if key in s:
		return s[key]
	else:
return ""
