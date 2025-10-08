from http.server import BaseHTTPRequestHandler, HTTPServer

class H(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hola desde mi-app')

HTTPServer(('0.0.0.0', 8080), H).serve_forever()
