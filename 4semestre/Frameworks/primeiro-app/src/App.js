import React from 'react';
import {Route, Routes, Link} from 'react-router-dom'
import Cadastro from './Cadastro';
import Usuario from './Usuario';
import Retorna from './Retorna';
import Json from './Json';
import RickAndMortyCharacters from './RickAndMortyCharacters';
import Joke from './Joke';
import JsonPost from './JsonPost';
import ApiFlask from './ApiFlask';

export default function App() {
  return (
      <>
    <header>
    <p><Link to='/cadastro'>Cadastro</Link></p>
    <p><Link to='/usuario'>Usuario</Link></p>
    <p><Link to='/retorna'>Retorna</Link></p>
    <p><Link to='/json'>Json</Link></p>
    <p><Link to='/RickAndMortyCharacters'>RickAndMortyCharacters</Link></p>
    <p><Link to='/Joke'>Joke</Link></p>
    <p><Link to='/JsonPost'>Json com Post</Link></p>
    <p><Link to='/ApiFlask'>Chamando api flask</Link></p>
    </header>
    <main>
        <Routes>
          <Route path='/usuario' element= {<Usuario/>}/>
          <Route path='/cadastro' element= {<Cadastro/>}/>
          <Route path='/retorna' element= {<Retorna/>}/>
          <Route path='/json' element= {<Json/>}/>
          <Route path='/RickAndMortyCharacters' element= {<RickAndMortyCharacters/>}/>
          <Route path='/Joke' element= {<Joke/>}/>
          <Route path='/JsonPost' element= {<JsonPost/>}/>
          <Route path='/ApiFlask' element= {<ApiFlask/>}/>
        </Routes>
      </main></>

  );
}