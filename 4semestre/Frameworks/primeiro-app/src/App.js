import React from 'react';
import {Route, Routes, Link} from 'react-router-dom'
import Cadastro from './Cadastro';
import RetornaText from './RetornaText';
import JsonReturn from './JsonReturn';
import RickAndMortyCharacters from './RickAndMortyCharacters';
import Joke from './Joke';
import JsonPost from './JsonPost';
import UsuarioPagInicial from './UsuarioPagInicial';
import GetApiFlask from './GetApiFlask';
import PostApiFlask from './PostApiFlask';

export default function App() {
  return (
      <>
    <header>
    <p><Link to='/Cadastro'>Cadastro</Link></p>
    <p><Link to='/UsuarioPagInicial'>Usuario</Link></p>
    <p><Link to='/RetornaText'>Retorna ao inicial</Link></p>
    <p><Link to='/JsonReturn'>retorna um json qualquer</Link></p>
    <p><Link to='/RickAndMortyCharacters'>RickAndMorty Caracteristicas</Link></p>
    <p><Link to='/Joke'>Piadas aleatorias em ingles</Link></p>
    <p><Link to='/JsonPost'>Post batendo em uma api aleatoria</Link></p>
    <p><Link to='/GetApiFlask'>fazendo um get no nosso back-end</Link></p>
    <p><Link to='/PostApiFlask'>fazendo um post no nosso back-end</Link></p>
    </header>
    <main>
        <Routes>
          <Route path='/UsuarioPagInicial' element= {<UsuarioPagInicial/>}/>
          <Route path='/Cadastro' element= {<Cadastro/>}/>
          <Route path='/RetornaText' element= {<RetornaText/>}/>
          <Route path='/JsonReturn' element= {<JsonReturn/>}/>
          <Route path='/RickAndMortyCharacters' element= {<RickAndMortyCharacters/>}/>
          <Route path='/Joke' element= {<Joke/>}/>
          <Route path='/JsonPost' element= {<JsonPost/>}/>
          <Route path='/GetApiFlask' element= {<GetApiFlask/>}/>
          <Route path='/PostApiFlask' element= {<PostApiFlask/>}/>
        </Routes>
      </main></>

  );
}