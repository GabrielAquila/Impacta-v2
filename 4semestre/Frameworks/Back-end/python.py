from flask import Flask, request, render_template

app= Flask(__name__)

@app.route('/Calculo') # Cria uma rota
def main():
    print('request:', request)
    primeira = request.args.get('primeira')
    segunda = request.args.get('segunda')
    if primeira and segunda:  
        primeira = float(primeira)
        segunda = float(segunda)

        media = (primeira + segunda) / 2
        if media >= 7:
            resultado = 'Aprovado'
        elif media >= 4:
            resultado = 'Recuperação'
        else:
            resultado = 'Reprovado'
    
    return render_template('index.html', media=media,resultado=resultado)

@app.route('/', methods=['GET'])
def main():
    return "meu primeiro site"



@app.route('/', methods=['GET'])
def main():
    return "meu primeiro site"

if __name__ == '__main__':  # Executa a aplicação
    app.run(debug=True)