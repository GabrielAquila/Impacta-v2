import React, { useState, useEffect } from 'react';
import axios from 'axios';

function Form() {
  const [nome, setNome] = useState('');
  const [idade, setIdade] = useState('');
  const [ra, setRa] = useState('');
  const [id, setId] = useState(null);
  const [formResponse, setFormResponse] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (formResponse) {
      setNome(formResponse.dados.nome);
      setIdade(formResponse.dados.idade);
      setRa(formResponse.dados.ra);
      setId(formResponse.id);
    }
  }, [formResponse]);

  const postApiFlask = async (event) => {
    event.preventDefault();
    const data = {
      "nome": nome,
      "idade": idade,
      "ra": ra
    };
    try {
      const response = await axios.post('http://127.0.0.1:5000/api/create_form', data);

      const responseData = response.data;
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
          <p>Nome: {formResponse.dados.nome}</p>
          <p>Idade: {formResponse.dados.idade}</p>
          <p>RA: {formResponse.dados.ra}</p>
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
