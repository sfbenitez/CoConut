
import os
import psycopg2


conn = psycopg2.connect("dbname= user= password= host= port= ")


def database_query(sql_query):
	cur = None
	print sql_query
	try:
		cur = conn.cursor()
		cur.execute(sql_query)
		resultado = cur.statusmessage
		conn.commit()
	except Exception , e:
		print 'ERROR:', e[0]
		if cur is not None:
			conn.rollback()
	finally:
		if cur is not None:
			cur.close()
return cur.statusmessage
