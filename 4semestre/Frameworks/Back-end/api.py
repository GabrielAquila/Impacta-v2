from flask import Flask, jsonify, request
from flask_cors import CORS
import random

app= Flask(__name__)
CORS(app)


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

identificadores = []


@app.route('/api', methods=['GET'])
def main():
    return 'Este é o corpo da resposta da API!'

@app.route('/api/json', methods=['GET'])
def json_form():
    response = jsonify(data)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/api/cont', methods=['GET'])
def cont_json():
    counter["value"] += 1
    return jsonify(counter)

@app.route('/api/create_form', methods=['POST'])
def create_form():
    id = random.randint(1, 101)
    while id in identificadores:
        id = random.randint(1, 101)
    identificadores.append(id)
    dados = request.get_json(force=True)
    response = jsonify({'id': id , 'dados': dados})
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response, 201

@app.route('/api/create_client', methods=['POST'])
def create():
    json_request = request.get_json(force=True)
    jsonReturn = {'id' : json_request['id'] , 'nome':json_request['nome'], 'Cadastro':'Cadastro realizado com sucesso'}
    response = jsonify(jsonReturn), 200
    return response


if __name__ == '__main__':
    app.run(debug=True)

