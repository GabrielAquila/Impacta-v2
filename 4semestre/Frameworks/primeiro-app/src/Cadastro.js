import React from 'react';
import { Link } from "react-router-dom";

function Cadastro() {
  return (
    <div className="container">
      <h1>Cadastro de Usuário</h1>
      <form action="enviar.php" method="post">
        <label htmlFor="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required/><br/>

        <label htmlFor="email">E-mail:</label>
        <input type="email" id="email" name="email" required/><br/>

        <label htmlFor="mensagem">Mensagem:</label>
        <textarea id="mensagem" name="mensagem" rows="5" required></textarea><br/>

        <input type="submit" value="Enviar"/>
      </form>
      <Link to="/">Retornar à página inicial</Link>
    </div>
  );
}

export default Cadastro;
