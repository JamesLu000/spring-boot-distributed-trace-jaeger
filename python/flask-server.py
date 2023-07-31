# a hello world flask server and get POST to an add function then return answer 

from flask import Flask
import logging
app = Flask(__name__)

@app.route("/")
def hello():
    logging.info(f"start")
    tmp = add(10, 10)
    while tmp > 5:
        tmp = minus(tmp, 5)
    return "Hello World!"

def add(a, b):
    logging.info(f"add function called, a={a}, b={b}")
    print(f"add function called, a={a}, b={b}")
    return a + b

def minus(a, b):
    logging.info(f"minus function called, a={a}, b={b}")
    print(f"minus function called, a={a}, b={b}") 
    return a - b
