import React, { useState } from 'react';

function Form() {
  const [nome, setNome] = useState('');
  const [idade, setIdade] = useState('');
  const [ra, setRa] = useState('');
  const [id, setId] = useState(null);
  const [formResponse, setFormResponse] = useState(null);
  const [error, setError] = useState(null);

  const postApiFlask = async (event) => {
    event.preventDefault();
    const data = {
      "nome": nome,
      "idade": idade,
      "ra": ra
    };
    try {
      const response = await fetch('http://127.0.0.1:5000/api/create_form', {
        method: 'POST',
        body: JSON.stringify(data),
        mode: 'no-cors',
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
        },
      });

      if (response !== 201) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Erro desconhecido');
      }

      const responseData = await response.json();
      setId(responseData.id);
      setFormResponse(responseData);
      setError(null);
    } catch (err) {
      setError(err.message || 'Erro desconhecido');
    }
  };

  return (
    <div>
      <form onSubmit={postApiFlask}>
        <label>
          Nome:
          <input type="text" value={nome} onChange={(event) => setNome(event.target.value)} />
        </label>
        <label>
          Idade:
          <input type="number" value={idade} onChange={(event) => setIdade(event.target.value)} />
        </label>
        <label>
          RA:
          <input type="text" value={ra} onChange={(event) => setRa(event.target.value)} />
        </label>
        <button type="submit" className="btn btn-warning">Enviar</button>
      </form>
      {formResponse && (
        <div>
          <p>ID: {formResponse.id}</p>
          <p>Nome: {formResponse.nome}</p>
          <p>Idade: {formResponse.idade}</p>
          <p>RA: {formResponse.ra}</p>
        </div>
      )}
      {error && (
        <div>
          <p>Error: {error}</p>
        </div>
      )}
    </div>
  );
}

export default Form;