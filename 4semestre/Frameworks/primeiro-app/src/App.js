import React from 'react';
import {Route, Routes, Link} from 'react-router-dom'
import Cadastro from './Cadastro';
import Usuario from './Usuario';
import Retorna from './Retorna';
import Json from './Json';

export default function App() {
  return (
      <>
    <header>
    <p><Link to='/cadastro'>Cadastro</Link></p>
    <p><Link to='/usuario'>Usuario</Link></p>
    <p><Link to='/retorna'>Retorna</Link></p>
    <p><Link to='/json'>Json</Link></p>
    </header>
    <main>
        <Routes>
          <Route path='/usuario' element= {<Usuario/>}/>
          <Route path='/cadastro' element= {<Cadastro/>}/>
          <Route path='/retorna' element= {<Retorna/>}/>
          <Route path='/json' element= {<Json/>}/>
        </Routes>
      </main></>
  );
}