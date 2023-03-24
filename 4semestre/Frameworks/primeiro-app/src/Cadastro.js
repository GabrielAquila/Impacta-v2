import React, { useState } from 'react';
import './Form.css';

function Cadastro() {
  const [nome, setNome] = useState('');
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');

  function handleSubmit(event) {
    event.preventDefault();
    console.log('Dados do formulário:', { nome, email, senha });
  }

  return (
    <div>
      <h1>Cadastro de Usuário</h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="nome">Nome:</label>
        <input
          type="text"
          id="nome"
          name="nome"
          value={nome}
          onChange={(event) => setNome(event.target.value)}
          required
        />
        <br />
        <br />
        <label htmlFor="email">E-mail:</label>
        <input
          type="email"
          id="email"
          name="email"
          value={email}
          onChange={(event) => setEmail(event.target.value)}
          required
        />
        <br />
        <br />
        <label htmlFor="senha">Senha:</label>
        <input
          type="password"
          id="senha"
          name="senha"
          value={senha}
          onChange={(event) => setSenha(event.target.value)}
          required
        />
        <br />
        <br />
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  );
}

export default Cadastro;
