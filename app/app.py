
import os
from bottle import route,run,get,template,request, static_file, response, redirect, app
import psycopg2

conn = psycopg2.connect("dbname=db_backup user=admin password=admin host=172.22.2.205")

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
	print sql_query
	try:
		cur = conn.cursor()
		cur.execute(sql_query)
		resultado = cur.fetchone()
	finally:
		if cur is not None:
			cur.close()
	return resultado

@route('/')
def index():
    sql_select="SELECT * FROM USERS"
    campos=database_select(sql_select)

    return template("index.tpl",  user_user=campos[0], user_name=campos[1])

run(host = '0.0.0.0', port = 8080)
