import React, { useState, useEffect } from 'react';
import axios from 'axios';

function RickAndMortyCharacters() {
  const [characters, setCharacters] = useState([]);

  useEffect(() => {
    axios.get('https://rickandmortyapi.com/api/character')
      .then(response => {
        setCharacters(response.data.results);
      })
      .catch(error => console.log(error));
  }, []);

  return (
    <div className="character-container">
      {characters.map((character) => (
        <div className="character-card" key={character.id}>
          <img src={character.image} alt={character.name} />
          <h3>{character.name}</h3>
          <p>Status: {character.status}</p>
          <p>Species: {character.species}</p>
          <p>Gender: {character.gender}</p>
        </div>
      ))}
    </div>
  );
}

export default RickAndMortyCharacters;
