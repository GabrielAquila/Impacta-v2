import React from 'react';
import { Link } from "react-router-dom";

function Cadastro() {
  return (
    <div>
        <header>Cadastro</header>
      <h1>Cadastro de Usuário</h1>
      <Link to="/">retornar a página inicial</Link>
    </div>
  );
}

export default Cadastro;
