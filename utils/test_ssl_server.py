#!/usr/local/bin/python

import BaseHTTPServer, SimpleHTTPServer
import ssl
import sys

if len(sys.argv) < 4:
    print("usage: %s certfile keyfile port" % sys.argv[0])
    sys.exit()

httpd = BaseHTTPServer.HTTPServer(('localhost', int(sys.argv[3])), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, certfile=sys.argv[1], server_side=True, keyfile = sys.argv[2])
httpd.serve_forever()
