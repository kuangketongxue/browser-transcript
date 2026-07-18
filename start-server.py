import http.server
import threading
import webbrowser
import os
import time
import sys

PORT = 8765
DIR = os.path.dirname(os.path.abspath(__file__))

os.chdir(DIR)
handler = http.server.SimpleHTTPRequestHandler
server = http.server.HTTPServer(('', PORT), handler)

threading.Thread(target=server.serve_forever, daemon=True).start()
print(f'Server running at http://localhost:{PORT}')
webbrowser.open(f'http://localhost:{PORT}')
print('Press Ctrl+C to stop.')
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    server.shutdown()
    print('Stopped.')
