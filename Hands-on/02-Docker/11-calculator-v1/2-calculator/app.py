from flask import Flask, request, jsonify
import urllib.request, json
from environs import Env
app = Flask(__name__)

env = Env()
env.read_env()  # read .env file, if it exists


@app.route('/calculatenums', methods=['GET'])
def calc():
    a = request.args.get('a', "0")
    b = request.args.get('b', "0")

    a = int(a)
    b = int(b)

    result = a + b

    print (result)

    random_number = get_random_number()

    print(f"random_number: {random_number}")

    result = {
        "result" : result + random_number,
        "a": a,
        "b": b,
        "random_number": random_number
    }

    return result

def get_random_number():
    RANDOM_NUMBER_APP_URL = env("RANDOM_NUMBER_APP_URL")
    RANDOM_NUMBER_APP_PORT = env("RANDOM_NUMBER_APP_PORT")
    url = f"{RANDOM_NUMBER_APP_URL}:{RANDOM_NUMBER_APP_PORT}/random_number"
    print(f"url: {url}")
    url = url.replace("//", "/")
    url = "http://" + url

    response = urllib.request.urlopen(url)

    print(f"response: {response}")

    dict = json.loads(response.read())

    return dict

if __name__ == '__main__':
    app.run(host=env("FLASK_SERVER_ACCEPT_FROM_IPS"), port=env.int("FLASK_SERVER_PORT"), debug=True)