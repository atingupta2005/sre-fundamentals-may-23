from flask import Flask, render_template, request
from environs import Env
import random

app = Flask(__name__)

env = Env()
env.read_env()  # read .env file, if it exists

@app.route('/random_number', methods=['GET', 'POST'])
def random_number():
    if request.method == 'GET':
        return str(random.randint(1, 100))
    else:
        return 'Not a valid request method for this route'

if __name__ == '__main__':
   app.run(host=env("FLASK_SERVER_ACCEPT_FROM_IPS"), port=env.int("FLASK_SERVER_PORT"), debug=True)
