from flask import Flask, jsonify,json

app= Flask(__name__)

counter = {"value":0}
data = [
    {
        'nome': 'O tal do gersinho',
        'idade': 160,
        'rg': '50123-x'
    }, 
    {
        'nome': 'Marinho Gonsalvez ',
        'idade': 1,
        'rg': '401245-x'
    }
]


@app.route('/api', methods=['GET'])
def main():
    return 'Este é o corpo da resposta da API!'

@app.route('/api/json', methods=['GET'])
def json_form():
    return jsonify(data)

@app.route('/api/cont', methods=['GET'])
def cont_json():
    counter["value"] += 1
    return jsonify(counter)

if __name__ == '__main__':
    app.run(debug=True)

