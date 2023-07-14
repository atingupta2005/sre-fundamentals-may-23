from flask import Flask, render_template, request
from environs import Env
import urllib.request, json

app = Flask(__name__)

env = Env()
env.read_env()  # read .env file, if it exists

@app.route('/')
def home():
    return render_template('home.html')

def calc_numbers(a, b):
    CALC_NUMBER_APP_URL = env("CALC_NUMBER_APP_URL")
    CALC_NUMBER_APP_PORT = env("CALC_NUMBER_APP_PORT")
    url = f"{CALC_NUMBER_APP_URL}:{CALC_NUMBER_APP_PORT}/calculatenums?a={a}&b={b}"
    print(f"url: {url}")
    url = url.replace("//", "/")
    url = "http://" + url

    response = urllib.request.urlopen(url)

    print(f"response: {response}")

    dict = json.loads(response.read())

    return dict


@app.route('/result', methods=['GET', 'POST'])
def result():
    print (request.method)
    if request.method == 'POST':
        #return render_template('result.html', result=request.form['result'])
        try:
            a = int(request.form.get("input1"))
        except:
            a = 0

        try:
            b = int(request.form.get("input2"))
        except:
            b = 0

        results = calc_numbers(a, b)
        return render_template('result.html', a=results['a'], b=results['b'], random_number=results['random_number'], result=results['result'])
    elif request.method == 'GET':
        return 'A GET request was made'
    else:
        return 'Not a valid request method for this route'

if __name__ == '__main__':
   app.run(host=env("FLASK_SERVER_ACCEPT_FROM_IPS"), port=env.int("FLASK_SERVER_PORT"), debug=True)
