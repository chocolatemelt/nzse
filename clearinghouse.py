from flask import abort, Flask, request

app = Flask(__name__)


@app.route("/")
def hello():
    return "hello"


@app.route("/register", methods=["POST"])
def register_user():
    user_id = request.form["user_id"]
    capital = 10000
    if not user_id:
        abort(400)
    # do some sqlalchemy
