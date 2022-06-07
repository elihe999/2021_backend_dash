# -*- coding:utf-8 -*-
#!/usr/bin/env python3
 
import json
from wsgiref.simple_server import make_server
import urllib.parse
import re
 
def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'application/json')])
    
    request_body = environ["wsgi.input"].read(int(environ.get("CONTENT_LENGTH", 0)))
    
    json_str = request_body.decode('utf-8')
    json_str = re.sub('\'','\"', json_str)
    print(json_str)

    return []
 
if __name__ == "__main__":
    port = 6088
    httpd = make_server("0.0.0.0", port , application)
    print("serving http on port {0}...".format(str(port)))
    httpd.serve_forever()
