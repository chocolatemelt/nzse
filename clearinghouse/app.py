from flask import Flask, request, jsonify
app = Flask(__name__)

# API
@app.route('/example_endpoint', methods=['GET', 'POST'])
def example_endpoint():
    if request.method == 'GET':
        params = request.args
    else:
        params = request.get_json(silent=True)
    test_result = {
        'params': params,
        'method': request.method
    }
    return jsonify(test_result)
