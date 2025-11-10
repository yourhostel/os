from flask import Flask
import shortuuid

app = Flask(__name__)

@app.route("/")
def hello_world():
    return shortuuid.uuid()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)