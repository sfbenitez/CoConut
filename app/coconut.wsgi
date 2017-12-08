import sys, os, bottle, coconut
import beaker.middleware

sys.path = ['/var/www/coconut/'] + sys.path

# Change working directory so relative paths (and template lookup) work again
os.chdir(os.path.dirname(__file__))

# ... build or import your bottle application here ...
# Do NOT use bottle.run() with mod_wsgi
application = beaker.middleware.SessionMiddleware(bottle.default_app(), coconut.session_opts)
