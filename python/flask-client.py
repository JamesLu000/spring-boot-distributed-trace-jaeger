# fastapi to call a flask server

import requests

for i in range(3):
    requests.get("http://localhost:5000/")
